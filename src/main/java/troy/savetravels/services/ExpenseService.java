package troy.savetravels.services;

import org.springframework.stereotype.Service;
import troy.savetravels.models.Expense;
import troy.savetravels.repositories.ExpenseRepository;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Service
public class ExpenseService {
    private final ExpenseRepository expenseRepo;

    public ExpenseService(ExpenseRepository expenseRepository) {
        this.expenseRepo = expenseRepository;
    }

    public void createExpense(Expense expense){
        expenseRepo.save(expense);
    }

    public List<Expense> allExpenses() {
        return (List<Expense>) expenseRepo.findAll();
    }

    public Expense getOne(Long id) {
        Optional<Expense> expense = expenseRepo.findById(id);
        return expense.orElse(null);
    }

    public void update(@Valid Expense expense) { expenseRepo.save(expense); }

    public void deleteExpense(Long id) { expenseRepo.deleteById(id); }
}
