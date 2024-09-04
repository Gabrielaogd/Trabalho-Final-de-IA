
        from pymol import cmd,stored
        
        set depth_cue, 1
        set fog_start, 0.4
        
        set_color b_col, [36,36,85]
        set_color t_col, [10,10,10]
        set bg_rgb_bottom, b_col
        set bg_rgb_top, t_col      
        set bg_gradient
        
        set  spec_power  =  200
        set  spec_refl   =  0
        
        load "data/3sgzA.pdb", protein
        create ligands, protein and organic
        select xlig, protein and organic
        delete xlig
        
        hide everything, all
        
        color white, elem c
        color bluewhite, protein
        #show_as cartoon, protein
        show surface, protein
        #set transparency, 0.15
        
        show sticks, ligands
        set stick_color, magenta
        
        
        
        
        # SAS points
 
        load "data/3sgzA.pdb_points.pdb.gz", points
        hide nonbonded, points
        show nb_spheres, points
        set sphere_scale, 0.2, points
        cmd.spectrum("b", "green_red", selection="points", minimum=0, maximum=0.7)
        
        
        stored.list=[]
        cmd.iterate("(resn STP)","stored.list.append(resi)")    # read info about residues STP
        lastSTP=stored.list[-1] # get the index of the last residue
        hide lines, resn STP
        
        cmd.select("rest", "resn STP and resi 0")
        
        for my_index in range(1,int(lastSTP)+1): cmd.select("pocket"+str(my_index), "resn STP and resi "+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.show("spheres","pocket"+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_scale","0.4","pocket"+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_transparency","0.1","pocket"+str(my_index))
        
        
        
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [1883,1884,1885,2270,2271,2273,187,179,180,182,146,1328,1357,1358,1359,1360,1395,1396,1866,1860,1861,1862,1869,1870,1872,2099,2123,2262,2265,2282,2245,2261,2104,2100,2097,2098,2101,1868,860,1041,1306,1492,183,185,631,633,635,184,1459,1465,1490,1481,1484,1307,1479,1397,1458,609,1023,614,617,619,620,624,846,2297,665,604,1867,1687,1043,264,257,259,266,290,69,2121,2122,296,298,2120,862] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [1535,1539,1545,1546,1547,1548,1549,1550,1525,1534,1537,1263,1260,1262,1551,1738,1739,1740,1257,1259,1529,1531,1575,1536,1573,1574] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [844,901,850,865,869,879,868,852,1015,1031,899,889,894,1141,1142,1107,1108] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [1240,1837,2251,2252,824,1001,1003] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [1272,1276,1252,1257,1258,1259,1286,1505,1525,1247,1529,1531,1526,1510,1028] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        