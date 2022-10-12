package troy.savetravels.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import troy.savetravels.models.Expense;

import java.util.List;

@Repository
public interface ExpenseRepository extends CrudRepository <Expense, Long> {

}
