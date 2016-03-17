/**
 * 
 */
package travelexperts.controller;

import java.io.IOException;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
/**
 * @author 716488
 *
 */
public class Main extends Application {
	private Stage primaryStage;
    private BorderPane rootLayout;
	/**
	 * @param args
	 */
	 @Override
	    public void start(Stage primaryStage) {
	        this.primaryStage = primaryStage;
	        this.primaryStage.setTitle("Travel Experts");

	        initRootLayout();
	        
	        // Display the Agents information
	        showAgentOverview();
	    }

	    /**
	 *  Initialize the Agent Layout
	 */
	private void showAgentOverview() {
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
			} 
		catch (IOException e) {
	            e.printStackTrace();
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
