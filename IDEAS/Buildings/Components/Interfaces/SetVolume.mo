within IDEAS.Buildings.Components.Interfaces;
model SetVolume "Block for setting volume of the zone"
  extends Modelica.Blocks.Icons.Block;
  parameter Modelica.SIunits.Volume V "Zone volume";

  parameter Boolean custome_n50;


  VolumePort volumePort "Port for setting volume"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
equation

  volumePort.V=V;

  if custome_n50 then
    volumePort.V_add_zone  =0;
  else
    volumePort.V_add_zone  =V;
  end if;



end SetVolume;
