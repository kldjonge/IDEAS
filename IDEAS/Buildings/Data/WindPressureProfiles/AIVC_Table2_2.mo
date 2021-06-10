within IDEAS.Buildings.Data.WindPressureProfiles;
record AIVC_Table2_2 "Table 2.2, Liddament 1996, A guide to energy efficient ventilation"

extends IDEAS.Buildings.Data.Interfaces.WindPressureProfile(
    Wall=[
    0, 0.4;
    45, 0.1;
    90, -0.3;
    135, -0.35;
    180, -0.2;
    225, -0.35;
    270, -0.3;
    315, 0.1;
    360, 0.4],
    Roof_10=[
    0,  -0.6;
    45,  -0.5;
    90,  -0.4;
    135,  -0.5;
    180,  -0.6;
    225,  -0.5;
    270,  -0.4;
    315,  -0.5;
    360,  -0.6],
    Roof_11_30=[
    0,  -0.4;
    45,  -0.5;
    90,  -0.6;
    135,  -0.5;
    180,  -0.4;
    225,  -0.5;
    270,  -0.6;
    315,  -0.5;
    360,  -0.4],
    Roof_30=[
    0,  0.3;
    45,  -0.4;
    90,  -0.6;
    135,  -0.4;
    180,  -0.5;
    225,  -0.4;
    270,  -0.6;
    315,  -0.4;
    360,  0.3])
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));

end AIVC_Table2_2;
