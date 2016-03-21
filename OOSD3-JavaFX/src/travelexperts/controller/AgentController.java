/**
 * 
 */
package travelexperts.controller;

import java.util.ArrayList;
import java.util.Vector;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.ComboBoxTableCell;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;
import javafx.util.converter.DefaultStringConverter;
import travelexperts.model.Agent;
import travelexperts.model.Customer;

/**
 * @author 716488
 *
 */
public class AgentController {
	
	// Controllers 
	@FXML
	public ComboBox<Integer> agentIDC;
	@FXML
	private Label  fnameL;
	@FXML
	private Label  mnameL;
	@FXML
	private Label  lnameL;
	@FXML
	private Label  bphoneL;
	@FXML
	private Label  emailL;
	@FXML
	private Label  posL;
	@FXML
	private Label agencyIDL;
	@FXML
	private Label valueDisplayL;
	@FXML
	public CheckBox agentStatusC;
	@FXML
	private Button exitButton;
	@FXML
	private Button saveButton;
	@FXML
    private TableView<Customer> customerAgentTable;
    @FXML
    private TableColumn<Customer, String> customerFirstNameColumn;
    @FXML
    private TableColumn<Customer, String> customerLastNameColumn;
    @FXML
    private TableColumn<Customer, String> agentIDColumn;
	
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
         agentStatusC.setSelected(true);
         showAgentsInfo();
         
         customerAgentTable.setEditable(true);
	 		customerFirstNameColumn.setCellValueFactory(new PropertyValueFactory<Customer, String>("CustFirstName"));
	 		customerLastNameColumn.setCellValueFactory(new PropertyValueFactory<Customer, String>("CustLastName"));
	 		//agentIDColumn.setCellValueFactory(new PropertyValueFactory<Customer, String>("AgentId"));
	 		
	 		ObservableList<Integer> cbValues = getAllAgentsIDs();
	 	    agentIDColumn.setCellFactory(ComboBoxTableCell.forTableColumn(new DefaultStringConverter(), cbValues.toString() ));
	 		customerAgentTable.setItems( showCustomersWithAgentID(agentIDC.getValue()));
				 		

 		
	    }
	 private ObservableList<Integer> getAllAgentsIDs() {
			// TODO Auto-generated method stub
			Vector<Agent> allAgents = new Vector<Agent>();
			allAgents=Agent.getAll();
			
			ArrayList<Integer> allAgentsAvailable = new ArrayList<Integer>() ;
			for(Agent agent: allAgents)
			{
				allAgentsAvailable.add(agent.getAgentId());
				
			}
			
			ObservableList<Integer> allAgent = FXCollections.observableList(allAgentsAvailable);
			
			return  allAgent;
		}
	 private ObservableList<Customer> showCustomersWithAgentID(int i) {
			// TODO Auto-generated method stub
			Vector<Customer> myCustomers = new Vector<Customer>();
			myCustomers=Customer.getByAgentId(i);
			
			ObservableList<Customer> agentsCustomer = FXCollections.observableList(myCustomers);
			return agentsCustomer;
			
		}
    //Exit button listener
	 @FXML
	    private void exit() {
		 
		  // get a handle to the stage
		    Stage stage = (Stage) exitButton.getScene().getWindow();
		    // do what you have to do
		    stage.close();

		
	    }
	
	 
	//calling agents to combobox
	public void showAgentsInfo()
	{
		
		
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
		customerAgentTable.setItems( showCustomersWithAgentID((int)agentIDC.getValue()));
		
	}
	
	// Changing Value on combobox selection
	public void getAgentData(int value) {
		// TODO Auto-generated method stub
		 Agent myAgent = new Agent();
	     myAgent=Agent.getById(value);
			
		if( agentIDC.getValue() != null){
        	String fname= myAgent.getAgtFirstName();
			fnameL.setText(fname);
			String lname= myAgent.getAgtLastName();
			lnameL.setText(lname);
			String mname= myAgent.getAgtMiddleInitial();
			mnameL.setText(mname);
			String busPhone= myAgent.getAgtBusPhone();
			bphoneL.setText(busPhone);
			String email= myAgent.getAgtEmail();
			emailL.setText(email);
			String pos= myAgent.getAgtPosition();
			posL.setText(pos);
			String agyID= Integer.toString(myAgent.getAgencyId());
			agencyIDL.setText(agyID);
			Boolean agentStatus = myAgent.getActive();
			agentStatusC.setSelected(agentStatus);
		}

	}
	
	public void setMainApp(Main main) {
		// TODO Auto-generated method stub
		 this.mainApp = mainApp;
		 
		 
	}
	
	 //Save button listener
	 @FXML
	 public void saveEventHandler() 
	 	{
		 Agent oldAgent = new Agent();
		 Agent newAgent = new Agent();
		// Agent updatedAgent = new Agent();
		 oldAgent=Agent.getById((int)agentIDC.getValue());
		 
		 newAgent.setAgentId(agentIDC.getValue());
		 newAgent.setAgtFirstName(fnameL.toString());
		 newAgent.setAgtMiddleInitial(mnameL.toString());
		 newAgent.setAgtLastName(lnameL.toString());
		 newAgent.setAgtBusPhone(bphoneL.toString());
		 newAgent.setAgtEmail(emailL.toString());
		 newAgent.setAgtPosition(posL.toString());
		 Integer Q = Integer.parseUnsignedInt(agencyIDL.toString());//.parseInt(agencyIDT.toString());
		 newAgent.setAgencyId(Q);
		 newAgent.setActive(Boolean.valueOf(agentStatusC.toString()));
		 
		 int Status = Agent.update(oldAgent, newAgent);
		 valueDisplayL.visibleProperty();
		 if( Status == 0)
		 {
			 
		 valueDisplayL.setText("Data Saved");
		 }
		 else
		 { 
		 valueDisplayL.setText(Q.toString());
		 }
	    }
	  
	     
	    
	  
	 }

