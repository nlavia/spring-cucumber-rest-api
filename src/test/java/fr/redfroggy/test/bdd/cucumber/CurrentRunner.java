package fr.redfroggy.test.bdd.cucumber;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
		tags = "@current",
        plugin = {"pretty", "html:target/cucumber", "json:target/cucumber.json"},
        features = "src/test/resources/features",
        glue = {"fr.redfroggy.test.bdd.glue"})
public class CurrentRunner {}



//package ar.com.lojack.runners;
//
//import org.junit.runner.RunWith;
//
//import ar.com.lojack.features.BasicCucumberTest;
//import cucumber.api.CucumberOptions;
//import cucumber.api.junit.Cucumber;
//
//@RunWith(Cucumber.class)
//@CucumberOptions(strict = true, tags = "@current", features = {"src/main/resources/"}, 
//				 glue = { "ar.com.lojack.features", "ar.com.lojack.steps" },
//				 format = { "ar.com.lojack.runners.ScenarioLogger", "json:target/cucumber.json", "html:target/cucumber" }, monochrome = true)
//public class CurrentRunner extends BasicCucumberTest {
//	
//	public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
//		ejecutar(args);
//	}
//}

