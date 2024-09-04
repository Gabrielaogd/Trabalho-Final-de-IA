
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
        
        load "data/2jgvD.pdb", protein
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
 
        load "data/2jgvD.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8637,8649,8652,8950,8674,8636,8949,8959,8960,9174,9175,9177,9178,9179,9201,8946,8985,9176,9385,9386,9387,9364,8961,8962,8980,9368,9102,9366,9367,9122,9124,8675,8491,8498,8499,8963,8964,8967,7927,7936,7993,8008,8009,9157,9165,9167,9168,9158,9416,8025,8024,9187,9188,7527,7528,7529,8259,8263,8264,8266,8267,8487,9202,9189,7330,7331,7332,7333,7519,7518,7521,7526,7922,7549,9169,9455,7289,7301,7305,8270,8271,7907,8029,8936] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [7507,7568,7569,7570,7571,7572,9459,7567,7601,7602,9466,7600,7759,7790,7806,7754,7756] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        