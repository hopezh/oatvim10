import bpy
import numpy as np
import torch

# oo: -- torch ---------------------------------------------------------------------
if torch.backends.mps.is_available():
    mps_device = torch.device("mps")
    x = torch.ones(1, device=mps_device)
    print("torch tensor on mac mps device:\n", x, "\n")
else:
    print("MPS device not found.", "\n")

# oo: -- numpy ---------------------------------------------------------------------
a = np.arange(15).reshape(3, 5)
print("np array a:\n", a, "\n")

# oo: -- bpy -----------------------------------------------------------------------
bpy.ops.mesh.primitive_cube_add(size=1)

cube_obj = bpy.context.active_object

location = cube_obj.location

cube_obj.location.x = 5
cube_obj.location.y = 5
cube_obj.location.z = 5

print("bpy cube obj:", cube_obj)


def add(a, b):
    return a + b
