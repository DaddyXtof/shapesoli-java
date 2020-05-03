// Stuff that matters:
// http://www.lagers.org.uk/g4p/ref/index.html
// http://www.lagers.org.uk/g4p/guides/g01-introduction.html

import g4p_controls.*;
import java.util.*;  

GButton btnLoad, btnSave, btnQuit;
GDropList drpList;
GView view2D, view3D;
GToggleGroup toggleGroup;
GOption[] options;
PShape shape;
Map<String,PShape> map=new HashMap<String,PShape>();
enum selectableShape {NOTHING, CIRCLE, SQUARE, TRIANGLE};
selectableShape selectedShape;

String[] shapeList=new String[20];

public void handleBtnLoad(GButton button, GEvent event)
{
	shape = loadShape("current.svg");
}

public void handleBtnSave(GButton button, GEvent event)
{

}

public void handleBtnQuit(GButton button, GEvent event)
{
	exit();
}

public void handleDrpList(GDropList list, GEvent event)
{
  println(list.getSelectedText());
	switch (list.getSelectedText()){
	case "Shapes...":
		selectedShape=selectableShape.NOTHING;
	break;
	case "Circle":
		selectedShape=selectableShape.CIRCLE;
	break;
	case "Square":
		selectedShape=selectableShape.SQUARE;
	break;
	case "Triangle":
		selectedShape=selectableShape.TRIANGLE;
	break;
	default: 
	}
}

void setup()
{
	size(1600,1000,P2D);
	//pixelDensity(2);
	pixelDensity(displayDensity());
	println("PixelDensity: "+displayDensity());
	background(#FAC218);
	selectedShape=selectableShape.NOTHING;

	surface.setTitle("Shape-Oli:"+width+"/"+height);

	btnLoad = new GButton(this, 10, 10, 70, 30, "Load SVG shape...");	
	btnLoad.addEventHandler(this, "handleBtnLoad");
	btnSave = new GButton(this, 10, 50, 70, 30, "Save SVG scene...");
	btnSave.addEventHandler(this, "handleBtnSave");
	btnQuit = new GButton(this, 10, 90, 70, 30, "Quit");	
	btnQuit.addEventHandler(this, "handleBtnQuit");
	
	drpList = new GDropList(this, 10, 130, 70, 100);
	drpList.addEventHandler(this, "handleDrpList");
	shapeList[0]="Shapes...";
	shapeList[1]="Circle";
	shapeList[2]="Square";
	shapeList[3]="Triangle";
	drpList.setItems(shapeList , 0);	

	String[] t = new String[] {
		"Layer 1", "Layer 2", "Layer 3", "Layer 4", "Layer 5", "Layer 6",
		"Layer 7", "Layer 8", "Layer 9", "Path"
	};

	toggleGroup = new GToggleGroup();
	options = new GOption[t.length];
	for (int i=0; i<options.length;i++) {
		options[i] = new GOption(this, 10, 170+i*30, 70, 30);
		options[i].setText(t[i]);
		toggleGroup.addControl(options[i]);
	}
	view2D = new GView(this, 90, 10, (width-110)/2, height-20, P2D);
	view3D = new GView(this, 90+(width-110)/2+10, 10, (width-110)/2, height-20, P3D);
	Classview2D viewer2D = new Classview2D();
	Classview3D viewer3D = new Classview3D();
	view2D.addListener(viewer2D);
	view3D.addListener(viewer3D);
}

void draw()
{
	background(#FAC218);
	if (shape!=null) {
    	shape(shape,10,height-10-70,70,70);
    }
}
