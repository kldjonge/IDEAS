within IDEAS.Buildings.Components.Interfaces;
model Setq50_surf
  "Block for setting the corrected q50 of the zone and to communicate the v50"
  extends Modelica.Blocks.Icons.Block;

  parameter Real v50_int;
  parameter Boolean InternalWall_int;
  parameter Boolean q50_costume_int;


  Modelica.Blocks.Interfaces.RealInput q50_zone annotation (Placement(
        transformation(extent={{-122,-86},{-82,-46}}), iconTransformation(
          extent={{-122,-86},{-82,-46}})));

  Modelica.Blocks.Interfaces.RealOutput v50    annotation (Placement(transformation(extent={{-96,-14},{-116,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput InternalWall    annotation (Placement(transformation(extent={{-96,70},{-116,90}})));
  Modelica.Blocks.Interfaces.BooleanOutput q50_costume    annotation (Placement(transformation(extent={{-96,32},{-116,52}})));


equation

v50_int=v50;
InternalWall_int=InternalWall;
q50_costume_int=q50_costume;

  annotation (Icon(graphics={Rectangle(extent={{-74,88},{78,-80}}, lineColor={28,
              108,200}), Ellipse(extent={{-64,68},{60,-56}}, lineColor={28,108,200})}));
end Setq50_surf;
