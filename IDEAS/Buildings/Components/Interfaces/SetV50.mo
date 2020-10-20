within IDEAS.Buildings.Components.Interfaces;
model SetV50 "Block for setting V50 of the zone"
  extends Modelica.Blocks.Icons.Block;

  parameter Modelica.SIunits.VolumeFlowRate V50 "Zone volume";
  parameter Boolean custome_n50;

  V50Port v50Port "Port for setting volume" annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));


equation
  if custome_n50 then
    v50Port.V50_zone=V50;
  else
    v50Port.V50_zone=0;
  end if;



  annotation ();
end SetV50;
