
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
        
        load "data/1k0iA.pdb", protein
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
 
        load "data/1k0iA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [325,327,328,329,305,316,319,774,773,332,333,334,335,337,338,336,1674,1717,1741,1742,1743,1718,1719,1720,340,749,1656,1463,1443,1462,2090,2092,2072,2326,2327,2340,2341,2343,2344,2347,2339,2328,341,2310,2329,1572,1574,1644,2317,1452,2308,2311,347,1555,2296,1444,1450,2312,2109,2105,2291,1655,1464,1465,1466,2293,2299,2349,79,82,86,87,80,2342,2371,1233,2257,2261,2262,2263,2264,1218,1222,1223,1224,1229,1230,63,1225,775,804,71,72,81,805,306,308,309,310,227,228,247,286,288,245,66,229,233] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [2696,2737,2740,2705,2977,2979,3042,3043,2734,2735,2736,2728,2938] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        