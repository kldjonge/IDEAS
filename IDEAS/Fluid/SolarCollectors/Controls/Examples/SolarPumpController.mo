within IDEAS.Fluid.SolarCollectors.Controls.Examples;
model SolarPumpController "Example for the solar pump controller"
  extends Modelica.Icons.Example;
  IDEAS.Fluid.SolarCollectors.Controls.CollectorPump pumCon(
    azi=0,
    til=0.78539816339745,
    per=IDEAS.Fluid.SolarCollectors.Data.GlazedFlatPlate.FP_ThermaLiteHS20())
    "Model controlling the on/off status of the pump"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  IDEAS.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
     filNam=Modelica.Utilities.Files.loadResource("modelica://IDEAS/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos"))
    "Weather data input file"
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=20,
    f=0.0001,
    offset=273.15 + 40) "Water inlet temperature"
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
equation
  connect(weaDat.weaBus, pumCon.weaBus)  annotation (Line(
      points={{-60,30},{-20,30},{-20,5},{-10,5}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(sine.y, pumCon.TIn)  annotation (Line(
      points={{-59,-30},{-20,-30},{-20,-4},{-12,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation ( __Dymola_Commands(file=
    "modelica://IDEAS/Resources/Scripts/Dymola/Fluid/SolarCollectors/Controls/Examples/SolarPumpController.mos"
        "Simulate and plot"),
    experiment(Tolerance=1e-6, StopTime=86400.0),
    Documentation(info="<html>
<p>
This model illustrates the use of the
<a href=\"modelica://IDEAS.Fluid.SolarCollectors.Controls.CollectorPump\">
IDEAS.Fluid.SolarCollectors.Controls.CollectorPump</a> model.
Based on weather data and inlet temperature, the controller switches the pump on
and off.
</p>
</html>", revisions="<html>
<ul>
<li>
November 7, 2022, by Michael Wetter:<br/>
Revised example to provide values for new parameters.<br/>
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/3074\">issue 3074</a>.
</li>
<li>
Mar 27, 2013 by Peter Grant:<br/>
First implementation.
</li>
</ul>
</html>"));
end SolarPumpController;
