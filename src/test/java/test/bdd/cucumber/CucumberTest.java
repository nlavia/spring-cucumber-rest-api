package test.bdd.cucumber;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
		tags = "~@wip",
        plugin = {"pretty", "html:target/cucumber"},
        features = "src/test/resources/features",
        glue = {"test.bdd.glue"})
public class CucumberTest {}
