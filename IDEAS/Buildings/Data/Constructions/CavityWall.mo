within IDEAS.Buildings.Data.Constructions;
record CavityWall
  "Cavity wall with fully-filled cavity"
  extends IDEAS.Buildings.Data.Interfaces.Construction(
    mats={IDEAS.Buildings.Data.Materials.Brick(d=0.08),
          IDEAS.Buildings.Data.Insulation.Rockwool(d=0.1),
          IDEAS.Buildings.Data.Materials.BrickHollow(d=0.14),
          IDEAS.Buildings.Data.Materials.Gypsum(d=0.015)});

  annotation (Documentation(info="<html>
<p>
Example implementation of a cavity wall.
</p>
</html>", revisions="<html>
<ul>
<li>
July 20, 2022, by Filip Jorissen:<br/>
Revised brick type for #1245.
</li>
<li>
November 14, 2016, by Filip Jorissen:<br/>
Revised implementation: removed insulationType.
</li>
</ul>
</html>"));
end CavityWall;
