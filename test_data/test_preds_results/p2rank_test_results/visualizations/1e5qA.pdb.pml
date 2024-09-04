
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
        
        load "data/1e5qA.pdb", protein
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
 
        load "data/1e5qA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [560,539,540,541,546,547,550,551,552,553,538,578,542,397,1290,1291,1292,1318,1287,1288,1289,1295,1298,1299,1294,82,544,235,378,228,232,233,234,239,244,737,557,558,728,729,730,725,739,1666,1667,1676,919,1284,3029,3030,89,3058,3059,722,90,531,532,73,97,533,65,66,69,70,60,223,80,68,267,268,226,227,934,720,923,925,927,920,924,1849,1850,1148,1155,1867,1150,1342,562,1320,1344,1345,1348,580,236,1347,1650,1651,1356] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [79,81,83,74,76,3017,3012,3016,3035,3001,2999,72,102,2672,2678,2679,2677,2965,2981,2980,2982,2680,2727,3013,2670,1266] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1827,1828,1142,1143,1125,1126,1812,1810,1811,1107,1536,1544,1554,1556,1523,1537,1420,1421,1422,1423,1402,1658,1659,1398,1400,1640,1639] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [2628,1355,1940,1335,1249,2664,1326] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [3041,3042,3043,3070,3364,3366,145,3007,3009,3010,168] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        