within IDEAS.Fluid.SolarCollectors.Types;
type SystemConfiguration = enumeration(
    Parallel "Panels connected in parallel",
    Series "Panels connected in series",
    Array "Rectangular array of panels")
  "Enumeration of options for how the panels are connected"
  annotation(Documentation(info="<html>
<p>
Enumeration used to define the different configurations of
solar thermal systems.
</p>
</html>"));
