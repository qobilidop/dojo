def lca(root, v1, v2):
    v1, v2 = min(v1, v2), max(v1, v2)
    if v1 <= root.info and root.info <= v2:
        return root
    elif root.info < v1:
        return lca(root.right, v1, v2)
    elif root.info > v2:
        return lca(root.left, v1, v2)
