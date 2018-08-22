within IDEAS.LIDEAS.Validation;
model Case900ValidationLinearInputs "Model to validate the linearization method by simulating both the original model (with all flags set to linear) and the obtained state space model."
  extends Case900ValidationNonLinearInputs(sim(linIntCon=true,
      linExtCon=true,
      linIntRad=true,
      linExtRad=true));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100000),
    __Dymola_Commands(file="Resources/Scripts/Dymola/LIDEAS/Validation/Case900ValidationLinearInputs.mos"
        "Linearise, simulate and plot"),
    Documentation(revisions="<html>
<ul>
<li>May 15, 2018 by Damien Picard: <br/>First implementation</li>
</ul>
</html>", info="<html>
<p>Notice that contrary to IDEAS.LIDEAS.Validation.ZoneWithInputsValidationLinear, not all flags were set to linear. This examples the rather large error between the zone model and the state space model.</p>
</html>"));
end Case900ValidationLinearInputs;