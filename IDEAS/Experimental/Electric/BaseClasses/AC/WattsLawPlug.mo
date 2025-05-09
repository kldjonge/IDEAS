within IDEAS.Experimental.Electric.BaseClasses.AC;
model WattsLawPlug "For use  with loads."
  parameter Integer numPha=1 "Choose the number of phases" annotation (choices(
        choice=1 "single phase", choice=3 "symmetrical 3 phase"));
  parameter Integer nLoads=1;
  Modelica.Electrical.QuasiStatic.Polyphase.Interfaces.NegativePlug vi(m=numPha)
    annotation (Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput[nLoads] P annotation (Placement(
        transformation(extent={{-90,20},{-50,60}}),  iconTransformation(extent={{-70,40},
            {-50,60}})));
  Modelica.Blocks.Interfaces.RealInput[nLoads] Q annotation (Placement(
        transformation(extent={{-100,-20},{-60,20}}), iconTransformation(extent={{-80,0},
            {-60,20}})));

  Modelica.Blocks.Math.Sum sum_P(final nin=nLoads)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Blocks.Math.Sum sum_Q(final nin=nLoads)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
equation
  for i in 1:numPha loop
    sum_P.y/numPha = Modelica.ComplexMath.real(vi.pin[i].v*
      Modelica.ComplexMath.conj(vi.pin[i].i));
    sum_Q.y/numPha = Modelica.ComplexMath.imag(vi.pin[i].v*
      Modelica.ComplexMath.conj(vi.pin[i].i));
  end for;

  connect(P, sum_P.u) annotation (Line(
      points={{-70,40},{-48,40},{-48,50},{-42,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q, sum_Q.u) annotation (Line(
      points={{-80,0},{-48,0},{-48,10},{-42,10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                   graphics={
        Ellipse(
          extent={{-50,50},{50,-50}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{50,0},{90,0}}, color={0,0,0}),
        Line(
          points={{0,50},{0,-50}},
          color={175,175,175},
          smooth=Smooth.None),
        Text(
          extent={{-38,42},{42,-38}},
          lineColor={0,0,0},
          fontName="Symbol",
          textString="W")}),     Diagram(graphics),Documentation(info="<html>
<p>
This model converts the apparent power to a nodal voltage and current. It can be used for single-phase (numPha=1) loads or three-phase (numPha=3) loads (symmetrically divided over all phases)
</p>
</html>", revisions="<html>
<ul>
<li>
January 22, 2015 by Juan Van Roy:<br/>
Documentation added.
</li>
</ul>
</html>"));
end WattsLawPlug;
