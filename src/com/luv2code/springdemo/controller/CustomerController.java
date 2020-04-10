package com.luv2code.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luv2code.springdemo.dao.CustomerDAO;
import com.luv2code.springdemo.entity.Customer;

@Controller  // indico a spring che questo è un controller
@RequestMapping("/customer")  //prima parte del path url web-customer-tracker/customer/
public class CustomerController {

	// need to inject the customer dao
	@Autowired //spring will scan for a component that implements CustomerDAO interface. dependency injection con java reflection. se ho piu
	//di una classe che implementa quella interfaccia devo utilizzare anche l'annotazione @Qualifier con la specifica della classe che voglio
	private CustomerDAO customerDAO;
	
	@RequestMapping("/list") //url path completo sarà web-customer-tracker/customer/list
	public String listCustomers(Model theModel) {
		
		// get customers from the dao
		List<Customer> theCustomers = customerDAO.getCustomers();
						
		// add the customers to the model
		theModel.addAttribute("customers", theCustomers);
				
		return "list-customers";
	}
	
}


