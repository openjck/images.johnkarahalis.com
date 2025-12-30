.PHONY: remove-metadata

# This removes all metadata from all files in "public", except for color profile
# metadata, which is needed to prevent the image from appearing differently than
# intended. exiftool still prints warnings about the color profile metadata
# being removed, though, apparently because it is first removed before being
# re-added. For that reason, "-q -q" is used to suppress warnings.
#
# https://photo.stackexchange.com/a/69742
remove-metadata:
	find public -type f -exec \
		exiftool -q -q -overwrite_original -all= -TagsFromFile @ -ColorSpaceTags \
		{} +
