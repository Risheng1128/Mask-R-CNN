
-include makefile.include

PYTHON = python3

# train model
all: labelme2coco
	$(PYTHON) recoat_maskrcnn.py --src $(TRAIN_SRC_PATH) --dst $(TRAIN_DST_PATH)

labelme2coco: labelme2coco.py
	$(PYTHON) labelme2coco.py $(COCO_SRC_PATH) $(COCO_DST_PATH) --labels $(LABEL_PATH)

# generate mask image
mask:
	$(PYTHON) recoat_json2mask.py --src $(MASK_SRC_PATH) --dst $(MASK_DST_PATH)

# load recoating model and detect images
detect:
	$(PYTHON) recoat_detect.py --src $(DETECT_SRC_PATH) --dst $(DETECT_DST_PATH) --model $(DETECT_MODEL)

# open recoat detecting system
recoat_system:
	$(PYTHON) recoat_system.py

# do geometric transform
geometric:
	$(PYTHON) melt_geometric.py --src $(GEOMETRIC_SRC_PATH) --dst $(GEOMETRIC_DST_PATH)

# isolate every workpieces in image
contour: geometric
	$(PYTHON) melt_contour.py --src $(CONTOUR_SRC_PATH) --mask $(CONTOUR_MASK_PATH) --dst $(CONTOUR_DST_PATH)

glcm:
	$(PYTHON) melt_glcm.py --src $(GLCM_SRC_PATH) --xlsx $(GLCM_XLSX)

computed_tomography:
	$(PYTHON) melt_jpg2dicom.py --src $(DICOM_SRC_PATH) --dst $(DICOM_DST_PATH)
	$(PYTHON) melt_dicom_viewer.py

# train xgboost model
train_xgboost:
	$(PYTHON) melt_xgboost.py --dst $(XGBOOST_DST_PATH)

clean:
	-@$(RM) -r $(RESULT)

# Download labelme2coco.py from wkentaro/labelme repository
labelme2coco.py:
	-@wget -q https://raw.githubusercontent.com/wkentaro/labelme/main/examples/instance_segmentation/labelme2coco.py
	@echo "File labelme2coco.py was patched."

distclean: clean
	-@$(RM) labelme2coco.py
