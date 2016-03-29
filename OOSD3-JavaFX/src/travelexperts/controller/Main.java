/**
 * 
 */
package travelexperts.controller;

import java.io.IOException;

import javafx.application.Application;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TabPane.TabClosingPolicy;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Pane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import travelexperts.model.Customer;
/**
 * @author 716488
 *
 */
public class Main extends Application {
	private Stage primaryStage;
    private BorderPane rootLayout;
    private static Main instance;
    @FXML 
    private TabPane travelExpertsTabpane;
    @FXML 
    private Tab packagesTab;
    @FXML 
    private Tab agentsTab;
    @FXML 
    private Tab searchTab;
    /**
	 * @param args
	 */
	 @Override
	  public void start(Stage primaryStage) {
	        this.primaryStage = primaryStage;
	        this.primaryStage.setTitle("Travel Experts");
	        
	        initRootLayout();
	        
	        //TabPane 
	        travelExpertsTabpane = new TabPane();
	        travelExpertsTabpane.setTabClosingPolicy(TabClosingPolicy.UNAVAILABLE);
	        
	        //Packages Tab 
	        packagesTab = new Tab();
	        packagesTab.setText("Packages");
	        // packages tab added to travelexperts tabpane
	        travelExpertsTabpane.getTabs().add(packagesTab);
	        packagesTab.setContent(showPackagesOverview());
	       
	        //Agents Tab
	        agentsTab = new Tab();
	        agentsTab.setText("Agents");
	        //agents  tab added to travelexperts tabpane
	        travelExpertsTabpane.getTabs().add(agentsTab);
	        agentsTab.setContent(showAgentOverview());
	        
	        //Search Tab
	        searchTab = new Tab();
	        searchTab.setText("Search");
	        //agents  tab added to travelexperts tabpane
	        travelExpertsTabpane.getTabs().add(searchTab);
	        
	        //tabpane added to the root layout
	        rootLayout.setCenter(travelExpertsTabpane);
	        primaryStage.show();
	       
	        
	        
	    }
	  public Stage getPrimaryStage() {
	        return primaryStage;
	    }
	 
	
	  public Main() {
	             instance = this;
	  }
	  public static Main getInstance() {
	        return instance;
	}
	    /**
	 *  Initialize the Agent Layout
	 */
	public AnchorPane showAgentOverview() {
		// TODO Auto-generated method stub
		try {
		 FXMLLoader loader = new FXMLLoader();//getClass().getResource("Agent.fxml"));
		 loader.setLocation(Main.class.getResource("Agent.fxml"));
         AnchorPane agentView = (AnchorPane) loader.load();
         
		 //set overview into the center of root layout
         rootLayout.setCenter(agentView);
         
         //Give control access to the main app
         AgentController controller = loader.getController();
	      controller.setMainApp(this);
	     // controller.showAgentsInfo();	
	      return agentView;	
		} 
		catch (IOException e) {
	            e.printStackTrace();
	            return null;
	        }		
	}
		public AnchorPane showPackagesOverview() {
        try {
            
        	FXMLLoader loader = new FXMLLoader();
   		    loader.setLocation(Main.class.getResource("Packages.fxml"));
            AnchorPane packageView = (AnchorPane) loader.load();
            
   		 //set overview into the center of root layout
            rootLayout.setCenter(packageView);
            
            //Give control access to the main app
            PackageController controller = loader.getController();
   	        controller.setMainApp(this);
   	       return packageView;
   	        // return controller.isOkClicked();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
		
    }
		/**
	     * Initializes the root layout.
	     */
	    public void initRootLayout() {
	        try {
	            // Load root layout from fxml file.
	            FXMLLoader loader = new FXMLLoader();
	            loader.setLocation(Main.class.getResource("RootLayout.fxml"));
	            rootLayout = (BorderPane) loader.load();

	            // Show the scene containing the root layout.
	            Scene scene = new Scene(rootLayout);
	            primaryStage.setScene(scene);
	            primaryStage.show();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

	

    public static void main(String[] args) {
        launch(args);
    }

}
