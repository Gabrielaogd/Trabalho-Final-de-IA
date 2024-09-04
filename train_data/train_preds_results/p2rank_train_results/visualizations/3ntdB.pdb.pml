
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
        
        load "data/3ntdB.pdb", protein
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
 
        load "data/3ntdB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5308,5310,5320,5323,5337,5338,4556,4559,4590,4591,4371,4601,4602,4603,4604,6578,4364,4366,4367,6705,6706,6709,6725,6733,4530,4531,4532,4538,5312,5313,4540,4537,4543,4544,4547,5162,5163,5167,5168,6576,6577,6568,5159,4372,5157,4353,4621,4629,4600,4606,4608,4610,5302,5300,5306,5519,5521,5527,5529,6304,6693,6305,5174,5528,5549,4628,5304] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [5521,5527,6295,6296,5529,6304,6298,5520,6695,5518,6696,6283,6305,5511,5508,5522,5526,5505,5506,5507,5675,5676,5677,5728,5715,5723,5729,5503,6285,6288,6289,6290] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [8344,8336,8339,8342,8337,8365,8366,8367,8368,8494,8491,7804,8511,8330,7846,7143,7784,8510,7756,7772,7773,7158,7785] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [5520,6695,5518,6696,5511,5508,5736,6922,5735,5505,5506,5507,5728,5715,5723,5729] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [6689,6908,6910,6900,6901,7011,7019,7020,6894,6670,6673,6675,6678,6667,6674,6684,5734,5735,7055,5731,7028] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [7419,7260,7261,5828,6978,7424,7425,6979,7416,7411,7413,5793,8538,5792,5794,5796,8579] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        