within IDEAS.Fluid.Chillers.ModularReversible;
model CarnotWithLosses
  "Reversible chiller using Carnot approach with losses (frost, heat, inertia)"
  extends IDEAS.Fluid.Chillers.ModularReversible.Modular(
    QHea_flow_nominal=PEle_nominal*refCyc.refCycChiHea.COP_nominal,
    redeclare model RefrigerantCycleChillerHeating =
        IDEAS.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.ConstantCarnotEffectiveness
        (
        PEle_nominal=PEle_nominal,
        redeclare
          IDEAS.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Frosting.NoFrosting
          iceFacCal,
        etaCarnot_nominal=etaCarnot_nominal,
        use_constAppTem=true,
        TAppCon_nominal=TAppCon_nominal,
        TAppEva_nominal=TAppEva_nominal),
    redeclare model RefrigerantCycleChillerCooling =
        IDEAS.Fluid.Chillers.ModularReversible.RefrigerantCycle.ConstantCarnotEffectiveness
        (
        redeclare
          IDEAS.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Frosting.FunctionalIcingFactor
          iceFacCal(redeclare function icingFactor =
              IDEAS.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Frosting.Functions.wetterAfjei1997),
        TAppCon_nominal=TAppCon_nominal,
        TAppEva_nominal=TAppEva_nominal,
        etaCarnot_nominal=etaCarnot_nominal),
    final allowDifferentDeviceIdentifiers=false,
    redeclare model RefrigerantCycleInertia =
        IDEAS.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Inertias.VariableOrder
        (
        final refIneFreConst=1/refIneTimCon,
        final nthOrd=1,
        initType=Modelica.Blocks.Types.Init.InitialOutput));

  parameter Real etaCarnot_nominal=0.3 "Constant Carnot effectiveness";
  parameter Modelica.Units.SI.TemperatureDifference TAppCon_nominal=if
      cpCon < 1500 then 5 else 2
    "Temperature difference between refrigerant and working fluid outlet in condenser"
    annotation(Dialog(group="Nominal condition"));
  parameter Modelica.Units.SI.TemperatureDifference TAppEva_nominal=if
      cpEva < 1500 then 5 else 2
    "Temperature difference between refrigerant and working fluid outlet in evaporator"
    annotation(Dialog(group="Nominal condition"));
  parameter Modelica.Units.SI.Time refIneTimCon = 300
    "Refrigerant cycle inertia time constant for first order delay"
    annotation(Dialog(group="Refrigerant cycle inertia"));
  parameter Integer nthOrd=1 "Order of refrigerant cycle interia"
    annotation(Dialog(group="Refrigerant cycle inertia"));


  annotation (Documentation(revisions="<html>
<ul>
<li>
  <i>October 2, 2022</i> by Fabian Wuellhorst:<br/>
  First implementation (see issue <a href=
  \"https://github.com/ibpsa/modelica-ibpsa/issues/1576\">#1576</a>)
</li>
</ul>
</html>", info="<html>
<p>
  Model of a reversible chiller.
</p>
<p>
  This model extends
  <a href=\"modelica://IDEAS.Fluid.Chillers.ModularReversible.Modular\">
  IDEAS.Fluid.Chillers.ModularReversible.Modular</a> and selects the
  constant Carnot effectiveness module for chillers
  (<a href=\"modelica://IDEAS.Fluid.Chillers.ModularReversible.RefrigerantCycle.ConstantCarnotEffectiveness\">
  IDEAS.Fluid.Chillers.ModularReversible.RefrigerantCycle.ConstantCarnotEffectiveness</a>)
  and heat pumps
  (<a href=\"modelica://IDEAS.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.ConstantCarnotEffectiveness\">
  IDEAS.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.ConstantCarnotEffectiveness</a>)
  to model a reversible chiller.
  For the heating operation, the nominal approach temperatures are used
  as a constant to avoid nonlinear system of equations.
</p>
<p>
  Furthermore, losses are enabled to model
  the chiller with a more realistic behaviour:
</p>
<ul>
<li>Heat losses to the ambient (can be disabled)</li>
<li>Refrigerant inertia using a first order delay</li>
<li>Evaporator frosting assuming an air-sink chiller</li>
</ul>
<p>
For more information, see
  <a href=\"modelica://IDEAS.Fluid.HeatPumps.ModularReversible.UsersGuide\">
  IDEAS.Fluid.HeatPumps.ModularReversible.UsersGuide</a>.
</p>
</html>"));
end CarnotWithLosses;
