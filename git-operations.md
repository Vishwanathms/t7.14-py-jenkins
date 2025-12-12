## Use the tag accordingly for accessing stable code.

# 1. Create annotated tag
git tag -a v2.3 -m "Release v2.3 with new features"

# 2. Push the tag
git push origin v2.3

# 3. Delete locally
git tag -d v1.0

# 4. Delete from remote
git push origin --delete v1.0
