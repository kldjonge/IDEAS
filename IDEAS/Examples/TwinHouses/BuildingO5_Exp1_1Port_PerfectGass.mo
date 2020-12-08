within IDEAS.Examples.TwinHouses;
model BuildingO5_Exp1_1Port_PerfectGass
  "Model for simulation of experiment 1 for the O5 building"
 extends BuildingN2_Exp1(
   bui=2,
   exp=1,
   redeclare BaseClasses.Structures.TwinhouseO5_AirPerfectGass
                                                struct,
   redeclare BaseClasses.Ventilation.Vent_TTH_pressureNetwork_AirPerfectGass vent,
    sim(interZonalAirFlowType=IDEAS.BoundaryConditions.Types.InterZonalAirFlow.OnePort, n50=1.64));

  Utilities.Time.CalendarTime calTim(zerTim=IDEAS.Utilities.Time.Types.ZeroTime.NY2014)
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StartTime=15000000,
      StopTime=23587200,
      Interval=600,
      Tolerance=1e-06,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentSetupOutput(events=false),
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=true,
      OutputCPUtime=true,
      OutputFlatModelica=false),
    __Dymola_Commands(file=
          "modelica://IDEAS/Resources/Scripts/Dymola/Examples/TwinHouses/BuildingO5_Exp1.mos"
        "Simulate and plot"));
end BuildingO5_Exp1_1Port_PerfectGass;
