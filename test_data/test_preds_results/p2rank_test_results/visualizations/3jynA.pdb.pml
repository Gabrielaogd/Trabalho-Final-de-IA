
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
        
        load "data/3jynA.pdb", protein
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
 
        load "data/3jynA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [355,1774,1954,1783,1786,1794,1790,1791,1792,1614,1615,1616,1621,1622,1623,1147,1149,946,1143,1150,1778,1780,1781,316,317,318,319,321,2322,2325,1139,1140,2366,2377,1798,2343,2344,2345,2346,1644,1803,2339,2342,1135,1136,2363,1121,1123,1315,1124,1317,918,945,663,670,1977,917,1975,329,327,330,365,367,1969,408,409,368,478,482,665,668,671,672,687,689,674,682,305,308,312,323,337,473,353,299,310,925,303,475,476,474,973,1971,1960,1965,972,2004,1979,1980,1430,1641] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [685,686,679,184,189,428,438,440,439,739,743,749,747,463,461,462,30,31,163,165,452,716,729,734,178,181,691,693] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [1166,1336,2176,1334,1364,2185,2200,2206,2192,2183,2186,2370,2375,2378,1158,2372,2383,2382] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [320,322,2332,354,2331,1797,341,342,386,385,343,344] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        