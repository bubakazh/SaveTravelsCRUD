package troy.savetravels.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import troy.savetravels.models.Expense;
import troy.savetravels.services.ExpenseService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

// RESTCONTROLLER VS CONTROLLER: CONTROLLING APIs VS CONTROLLING .jsp FILES
@Controller
public class MainController {
    @Autowired
    ExpenseService service;

    // ! READ ALL
    @GetMapping("/")
    public String index(@ModelAttribute("expense") Expense expense, Model model) {
        List<Expense> expenses = service.allExpenses();
        model.addAttribute("expenses", expenses);
        return "index.jsp";
    }

    // ! CREATE
    @PostMapping("/handleit")
    public String createExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
        List<Expense> expenses = service.allExpenses();
        model.addAttribute("expenses", expenses);
        // I DON'T UNDERSTAND WHY WHEN THERE IS AN ERROR IN THE FORM, IT REDIRECTS TO /handleit TO DISPLAY VALIDATIONS.
        // I INCLUDED THE ABOVE TWO LINES SO THAT THE TABLE WOULD POPULATE WHILE AT "/handleit".
        // INTERESTINGLY ENOUGH, THE FORM IS STILL FUNCTIONAL WHILE AT ...8080/handleit
        // I WANT TO FIX THIS SO THAT IT DOESN'T REDIRECT TO "/handleit".
        if (result.hasErrors()) {
            return "index.jsp";
        } else {
            service.createExpense(expense);
            return "redirect:/";
        }
    }

    // ! EDIT
    @GetMapping("/edit/{id}")
    public String editBook(HttpSession session, Model model, @PathVariable("id")Long id){
        Expense expense = service.getOne(id);
        model.addAttribute("expense", expense);
        return "edit.jsp";
    }

    @PutMapping("/handledit/{id}")
    public Object updateBook(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
        if(result.hasErrors()) {
            return "edit.jsp";
        } else {
            service.update(expense);
            return "redirect:/";
        }
    }

    // ! DELETE
    @DeleteMapping("/delete/{id}")
    public String destroy(@PathVariable("id")Long id){
        service.deleteExpense(id);
        return "redirect:/";
    }
}