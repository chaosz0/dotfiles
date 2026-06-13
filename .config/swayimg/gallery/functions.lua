local M = {}

function M.invert()
    local image = swayimg.gallery.get_image()
    if not image or not image.path then return end

    local escaped_path = "'" .. image.path:gsub("'", "'\\''") .. "'"
    local cmd = string.format("convert %s -channel RGB -negate - | swayimg -", escaped_path)
    os.execute(cmd)
end

return M

