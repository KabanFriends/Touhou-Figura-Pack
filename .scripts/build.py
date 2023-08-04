import shutil
import json
import os

for name in os.listdir(".."):
    if os.path.isdir("../" + name):
        basedir = "../" + name + "/"
        if os.path.isfile(basedir + "avatar.json"):
            print("# BUILD: " + name)

            if os.path.exists(basedir + "skull.bbmodel"):
                print("removing old skull file")
                os.remove(basedir + "skull.bbmodel")

            print("copying skull files")
            shutil.copyfile("files/skull.bbmodel", basedir + "skull.bbmodel")

            with open(basedir + "avatar.json", "r", encoding="utf-8") as f:
                avatar = json.load(f)

            if os.path.exists(basedir + "components"):
                print("removing old components")
                shutil.rmtree(basedir + "components")

            if "components" in avatar:
                os.mkdir(basedir + "components")
                print("copying components")
                for comp in avatar["components"]:
                    print("component: " + comp)
                    shutil.copyfile("components/" + comp + ".lua", basedir + "components/" + comp + ".lua")
