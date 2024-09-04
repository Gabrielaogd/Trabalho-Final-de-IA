
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
        
        load "data/1ndiA.pdb", protein
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
 
        load "data/1ndiA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2533,2534,2535,642,644,645,2515,2559,631,634,629,4316,4315,4166,4191,4144,3971,633,739,741,753,727,737,740,4312,4314,4307,672,3404,3405,3420,3421,3400,3401,3402,3403,3524,4168,603,604,3913,3909,3943,3944,3947,3949,3950,4147,4145,4146,4119,4121,2555,2556,3510,3509,4293,4294,4295,4296,4297,4298,4303,4195,4203,4204,4299,2560,4276,2570,3419,4208] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [2250,2284,2243,2279,2280,2286,3012,3054,3009,3034,2288,2314,2287,2290,2316,3019,2133,2318,2132,2229,2138,2215,2221,2225,2226,2227,2228,2223,2253] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1094,4211,4212,4209,4213,3419,3226,3228,3413,3415,3225,3833,3213,1095,3427,3430,3865,3423,3533] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [733,732,734,3003,2996,4493,4494,2999,3001,3027,3030,4490,4491,4492] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [1399,1400,2046,2048,1398,1382,1378,1381,2022,2018,1497,1499,1498,2021,1992,1995,2807] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        