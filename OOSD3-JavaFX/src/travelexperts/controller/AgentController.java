/**
 * 
 */
package travelexperts.controller;

import java.util.Vector;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;
import travelexperts.model.Agent;

/**
 * @author 716488
 *
 */
public class AgentController {
	
	// Controllers 
	@FXML
	public ComboBox<Integer> agentIDC;
	@FXML
	private TextField  fnameT;
	@FXML
	private TextField  mnameT;
	@FXML
	private TextField  lnameT;
	@FXML
	private TextField  bphoneT;
	@FXML
	private TextField  emailT;
	@FXML
	private TextField  posT;
	@FXML
	private TextField agencyIDT;
	@FXML
	private CheckBox agentStatusC;
	@FXML
	private Button exitButton;
	
	// Combobox Default Value
	private int defaultIndex =1;
	//Agent object
	private Agent agentC = new Agent();
	//Object of the Main class
	private Main mainApp;
	
	//initiation function
	 @FXML
	    private void initialize() 
	 	{
		 agentIDC.setValue(defaultIndex);
         agentStatusC.setSelected(false);
         showAgentsInfo();
	    }
    //button listener
	 @FXML
	    private void exit() {
		 
		 Alert alert = new Alert(AlertType.CONFIRMATION);
		 alert.setTitle("Confirmation Dialog");
		 alert.setHeaderText("Look, a Confirmation Dialog");
		 alert.setContentText("Are you ok with this?");

		
	    }
	
	//calling agents to combobox
	public void showAgentsInfo()
	{
		
		travelexperts.model.TravelExpertsDB.connectDB();
		
		Vector<Agent> myAgent = new Vector<Agent>();
		myAgent=agentC.getAll();
		
		 	for(Agent agent : myAgent)
		 	{	
			agentIDC.getItems().addAll(agent.getAgentId());
		 	}
			AgentComboListener();	
    }
	
	// Combobox Listener
	public void AgentComboListener() {
		// TODO Auto-generated method stub
		getAgentData((int)agentIDC.getValue());
	}
	
	// Changing Value on combobox selection
	public void getAgentData(int value) {
		// TODO Auto-generated method stub
		Agent myAgent = new Agent();
		myAgent=Agent.getById(value);
			
		if( agentIDC.getValue() != null){
        	String fname= myAgent.getAgtFirstName();
			fnameT.setText(fname);
			String lname= myAgent.getAgtLastName();
			lnameT.setText(lname);
			String mname= myAgent.getAgtMiddleInitial();
			mnameT.setText(mname);
			String busPhone= myAgent.getAgtBusPhone();
			bphoneT.setText(busPhone);
			String email= myAgent.getAgtEmail();
			emailT.setText(email);
			String pos= myAgent.getAgtPosition();
			posT.setText(pos);
			String agyID= Integer.toString(myAgent.getAgencyId());
			agencyIDT.setText(agyID);
			Boolean agentStatus = myAgent.getActive();
			agentStatusC.setSelected(agentStatus);
		}

	}
	/**
	 * @param main
	 */
	public void setMainApp(Main main) {
		// TODO Auto-generated method stub
		 this.mainApp = mainApp;
		 
		 
	}
	
}
