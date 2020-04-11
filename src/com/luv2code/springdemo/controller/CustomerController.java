package com.luv2code.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luv2code.springdemo.dao.CustomerDAO;
import com.luv2code.springdemo.entity.Customer;
import com.luv2code.springdemo.service.CustomerService;

@Controller  // indico a spring che questo è un controller
@RequestMapping("/customer")  //prima parte del path url web-customer-tracker/customer/
public class CustomerController {
	
	//need to inject customer service
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/list") //url path completo sarà web-customer-tracker/customer/list
	public String listCustomers(Model theModel) {
		
		// get customers from the service
		List<Customer> theCustomers = customerService.getCustomers();
						
		// add the customers to the model
		theModel.addAttribute("customers", theCustomers);
				
		return "list-customers";
	}
	
}


