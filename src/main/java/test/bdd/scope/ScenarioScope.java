package test.bdd.scope;

import java.util.HashMap;
import java.util.Map;

/**
 * Scenario scope to store data
 * Created by Michael on 08/02/2017.
 */
public class ScenarioScope {

    //Store http headers
    private Map<String,Object> headers;

    //Store json paths
    private Map<String,Object> jsonPaths;

    public ScenarioScope() {
        headers = new HashMap<>();
        jsonPaths = new HashMap<>();
    }

    public Map<String, Object> getHeaders() {
        return headers;
    }

    public Map<String, Object> getJsonPaths() {
        return jsonPaths;
    }

    public boolean checkProperty(String property, String value) {
        Object headerValue = headers.get(property);
        boolean isHeader = headerValue != null && headerValue.equals(value);

        Object jsonPathValue = jsonPaths.get(property);
        boolean isJsonPath = jsonPathValue != null && jsonPathValue.equals(value);

        return isHeader || isJsonPath;
    }
    
    public String checkVariable(String property) {
     //   Object headerValue = headers.get(property);
        Object jsonPathValue = jsonPaths.get(property);
       String value = new String();
        value = jsonPathValue.toString();
     //   boolean isJsonPath = jsonPathValue != null && jsonPathValue.equals(value);

        return value;
    }
}
