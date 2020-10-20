within IDEAS.Buildings.Components.Interfaces;
connector VolumePort "Port for summing zone volumes"
  Modelica.SIunits.Volume V_tot "Total volume";
  flow Modelica.SIunits.Volume V "Volume";


  Modelica.SIunits.Volume V_add "non custom building volume";
  flow Modelica.SIunits.Volume V_add_zone "Volume";



  annotation (Documentation(info="<html>

</html>"));
end VolumePort;
