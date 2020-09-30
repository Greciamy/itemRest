package runner;

import clientAPI.FactoryRequest;
import clientAPI.RequestInformation;
import clientAPI.ResponseInformation;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import helpers.JsonHelper;
import org.json.JSONException;
import org.junit.Assert;

import java.util.HashMap;
import java.util.Map;

import static configuration.Configuration.*;

public class MyStepdefs {

    ResponseInformation response = new ResponseInformation();
    Map<String, String> variables = new HashMap<>();

    @Given("^I have authenticated to todo\\.ly$")
    public void iHaveAuthenticationToTodoLy() {
    }

    @When("^I send (POST) request '(.*)' with json to add an item after that$")
    public void iSendPOSTRequestApiProjectsJsonWithJsonToAddAnItemAfterThat(String method, String url, String jsonBody) {
        RequestInformation request = new RequestInformation();
        request.setUrl(HOST + this.replaceVariables(url));
        request.setBody(this.replaceVariables(jsonBody));
        request.addHeaders(BASIC_AUTHENTICATION_HEADER, BASIC_AUTHENTICATION);

        response = FactoryRequest.make(method.toLowerCase()).send(request);
    }

    @When("^I send (POST|PUT|DELETE|GET) request '(.*)' with json$")
    public void iSendPOSTRequestApiProjectsJsonWithJson(String method,String url, String jsonBody) {
        RequestInformation request = new RequestInformation();
        request.setUrl(HOST + this.replaceVariables(url));
        request.setBody(this.replaceVariables(jsonBody));
        request.addHeaders(BASIC_AUTHENTICATION_HEADER, BASIC_AUTHENTICATION);

        response = FactoryRequest.make(method.toLowerCase()).send(request);
    }

    @And("^I expected the response body is equal$")
    public void iExpectedTheResponseBodyIsEqual(String expectedResponseBody) throws JSONException {
        System.out.println("Response body " + this.replaceVariables(response.getResponseBody()));
        Assert.assertTrue("ERROR el response body es incorrecto", JsonHelper.areEqualJSON(this.replaceVariables(expectedResponseBody), response.getResponseBody()));
    }

    @Then("^I expected the response code (\\d+)$")
    public void iExpectedTheResponseCode(int expectedResponseCode) throws JSONException {
        System.out.println("Response body: " + response.getResponseCode() + "\n");
        Assert.assertEquals("ERROR el response code es incorrecto ", expectedResponseCode, response.getResponseCode());
    }

    @And("^I get the property value '(.*)' and save on (.*)$")
    public void iGetThePropertyValueContentAndSaveOnVARIABLE(String property, String nameVariable) throws JSONException {
        String value = JsonHelper.getValueFromJSON(response.getResponseBody(), property);
        variables.put(nameVariable, value);
        System.out.println("Variable: " + nameVariable + " value: " + variables.get(nameVariable));
    }

    private String replaceVariables(String value) {
        for (String key:this.variables.keySet()) {
            value = value.replace(key, this.variables.get(key));
        }
        return value;
    }

}
