within IDEAS.Buildings.Components.Interfaces;
model Setq50 "Block for setting the corrected q50 of the walls"

extends
      Modelica.Blocks.Icons.Block;

parameter Integer nSurf(min=1)
  "number of surfaces in contact with the zone";
parameter Modelica.SIunits.VolumeFlowRate V50;

parameter Modelica.SIunits.VolumeFlowRate V50_cust(fixed=false);
parameter Modelica.SIunits.VolumeFlowRate V50_add(fixed=false);


parameter Real NotintWall_real[nSurf]( fixed=false);
parameter Real q50_cust_real[nSurf]( fixed=false);
parameter Real q50_add_real[nSurf]( fixed=false);

Modelica.Blocks.Interfaces.RealInput A[nSurf]
  annotation (Placement(transformation(extent={{-124,48},{-84,88}})));
Modelica.Blocks.Interfaces.RealInput v50[nSurf]
  annotation (Placement(transformation(extent={{-124,12},{-84,52}})));
Modelica.Blocks.Interfaces.BooleanInput IntWall[nSurf]
  annotation (Placement(transformation(extent={{-124,-34},{-84,6}})));
Modelica.Blocks.Interfaces.BooleanInput q50_custome[nSurf]
  annotation (Placement(transformation(extent={{-124,-72},{-84,-32}})));
parameter Modelica.Blocks.Interfaces.RealOutput q50_cor[nSurf](unit="m3/(h.m2)", fixed=false)
  annotation (Placement(transformation(extent={{-96,-100},{-116,-80}})));

initial equation

for
i in 1:nSurf loop

  NotintWall_real[i] = if not IntWall[i] then 1 else 0;
  q50_cust_real[i] = if q50_custome[i] then 1 else 0;
  q50_add_real[i] = if not q50_custome[i] then 1 else 0;

  q50_cor[i] = (V50_add/sum(A*NotintWall_real*q50_add_real))*3600;

end for;

V50_cust = sum(q50_cust_real*v50);
V50 = V50_add + V50_cust;

annotation (Icon(graphics={Rectangle(extent={{-72,84},{80,-84}}, lineColor={
            28,
          108,200}), Ellipse(extent={{-60,62},{64,-62}}, lineColor={28,108,200})}));
end Setq50;
