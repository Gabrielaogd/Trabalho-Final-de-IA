
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
        
        load "data/3vkjC.pdb", protein
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
 
        load "data/3vkjC.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [7075,6101,6095,6097,6100,7311,7089,7090,7313,7314,6102,6779,6780,6781,6782,6802,6803,6536,6099,6105,6305,6308,6762,6764,6312,6763,6765,6766,6809,6810,6838,6562,6563,6812,6311,6114,6313,6330,6331,6572,7290,7291,7310,7293,7287,7086,7087,7091,7092,7265,7839,7840,7841,7292,7719,7844,6090,7695,7696,7699,7835,7826,7828,7703,7706,5664,5665,5666,5672,5667,5668,5669,5670,5671,5700,7868,5673,5678,7846,6109,7074,7252,7693,7694] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [6771,6773,6774,6788,6789,6892,7081,7084,7144,6889,6888,6887,7142,7143,7098,7530,7523,7524,7106,7115,7119,7539,7120,7166,6938,7174,6937,6790,6791,6794,7099] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [7073,7074,7252,6077,7059,6523,6089,6086,6092,6294] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        