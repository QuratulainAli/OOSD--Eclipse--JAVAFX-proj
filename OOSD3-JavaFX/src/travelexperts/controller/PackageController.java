/**
 * 
 */
package travelexperts.controller;

import java.util.Date;
import java.util.Vector;


import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import travelexperts.model.Packages;

/**
 * @author 716488
 *
 */
public class PackageController {


	private Main mainApp;
	@FXML
    private TableView<Packages> packagesTable;
    @FXML
    private TableColumn<Packages, String> packageIDColumn;
    @FXML
    private TableColumn<Packages, String> packageNameColumn;
    @FXML
    private TableColumn<Packages, String> packagePriceColumn;
    @FXML
    private Label packageIDL;
    @FXML
    private Label packageAgencyCommL;
    @FXML
    private Label packageBasePriceL;
    @FXML
    private Label packageDescL;
    @FXML
    private Label packageEndDateL;
    @FXML
    private Label packageStartDateL;
    @FXML
    private Label packageNameL;
    

    
	/**
	 * @param main
	 */
	public void setMainApp(Main mainapp) {
		// TODO Auto-generated method stub
		this.mainApp = mainApp;
	}
	
	public void initialize()
	{
		packageIDColumn.setCellValueFactory(new PropertyValueFactory<Packages, String>("PackageId"));
		packageNameColumn.setCellValueFactory(new PropertyValueFactory<Packages, String>("PkgName"));
		packagePriceColumn.setCellValueFactory(new PropertyValueFactory<Packages, String>("PkgBasePrice"));
		packagesTable.setItems(getAllPackages());
		   // Listen for selection changes and show the person details when changed.
        packagesTable.getSelectionModel().selectedItemProperty().addListener(
                (observable, oldValue, newValue) -> showPackageDetails(newValue));
	}

	/**
	 * @param newValue
	 * @return
	 */
	private void showPackageDetails(Packages newPackage) {
		// TODO Auto-generated method stub
		 if (newPackage != null) {
		        // Fill the labels with info from the person object.
			    int pckID=newPackage.getPackageId();
				packageIDL.setText(Integer.toString(pckID));
				double pckComm=newPackage.getPkgAgencyCommission();
	     	    packageAgencyCommL.setText(Double.toString(pckComm));
	     	    double pckBaseP=newPackage.getPkgBasePrice();
	     	    packageBasePriceL.setText(Double.toString(pckBaseP));
	     	    String pckDesc = newPackage.getPkgDesc();
	     	    packageDescL.setText(pckDesc);
	     	    Date pckEndDate=newPackage.getPkgEndDate();
	     	    packageEndDateL.setText(pckEndDate.toString());
	     	    Date pckStartDate=newPackage.getPkgEndDate();
	     	    packageStartDateL.setText(pckEndDate.toString());
	     	    String pckName=newPackage.getPkgName();
	     	    packageNameL.setText(pckName);
	        } 
		 else {
	            // Person is null, remove all the text.
	        	    packageIDL.setText("");
	        	    packageAgencyCommL.setText("");
	        	    packageBasePriceL.setText("");
	        	    packageDescL.setText("");
	        	    packageEndDateL.setText("");
	        	    packageStartDateL.setText("");
	        	    packageNameL.setText("");
	        }
	}

	/**
	 * @return
	 */
	private ObservableList<Packages> getAllPackages() {
		// TODO Auto-generated method stub
		Vector<Packages> myPackages = new Vector<Packages>();
		myPackages=Packages.getAll();
		
		ObservableList<Packages> allPackages = FXCollections.observableList(myPackages);
		return allPackages;
	}

	/**
	 * 
	 */
	public PackageController() {
		super();
		// TODO Auto-generated constructor stub
	}

}
