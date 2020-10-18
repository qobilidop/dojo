def checkBST(root):
    if root is None:
        return True
    valid, _, _ = checkNode(root)
    return valid

def checkNode(node):
    cvalid, cmin, cmax = True, node.data, node.data
    if node.left is not None:
        lvalid, lmin, lmax = checkNode(node.left)
        cvalid = cvalid and lvalid and lmax < node.data
        cmin = min(cmin, lmin)
    if node.right is not None:
        rvalid, rmin, rmax = checkNode(node.right)
        cvalid = cvalid and rvalid and node.data < rmin
        cmax = max(cmax, rmax)
    return cvalid, cmin, cmax
