within IDEAS.Buildings.Data.Interfaces;
partial record WindPressureProfile "Partial record for WindPressureProfiles"
  extends Modelica.Icons.MaterialProperty;

    parameter Real Wall[:,:] "Cp as a function of the wind angle, for vertical walls";
    parameter Real Roof_10[:,:] "Roof with a pitch less or equal to 10°";
    parameter Real Roof_11_30[:,:] "Roof with a pitch between 11° and 30°";
    parameter Real Roof_30[:,:] "Roof with a pitch of 30° or higher";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
This record template is used to specify a set of wind pressure profiles. Each profile provides the wind pressure coeffients 
as a function of the angle of attack at different inclination angles (tilt). 

The set used for simulation is specified in the IDEAS.BoundaryConditions.SimInfoManager. The IDEAS.Buildings.Components.OuterWall and IDEAS.Buildings.Components.Window component select the correct profile based on the specified iclination (inc).
</html>"));
end WindPressureProfile;
