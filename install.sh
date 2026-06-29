#!/bin/bash
# ============================================================
#  WorkBuddy Skills 三合一 安装脚本 (Mac/Linux)
#  用法: chmod +x install.sh && ./install.sh
# ============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$HOME/.workbuddy/skills"

# Define skills to install
declare -A SKILL_MAP=(
    ["product-dev-workflow"]="通用6阶段产品开发框架"
    ["ouyun-sgrade-market-analysis"]="欧孕S级深度市场分析SOP"
    ["category-prompts"]="四品类AI提示词模板库"
)

echo ""
echo "============================================================"
echo "  WorkBuddy Skills 套装安装器 (v2.0)"
echo "  包含 3 个 Skill"
echo "============================================================"
echo ""

# Create target directory
mkdir -p "$SKILLS_DIR"
echo "[OK] Skills directory: $SKILLS_DIR"
echo ""

# Install each skill
INSTALLED=0
FAILED=0
for SKILL_NAME in "${!SKILL_MAP[@]}"; do
    DESC="${SKILL_MAP[$SKILL_NAME]}"
    echo "---"
    echo "[$INSTALLED] Installing: $SKILL_NAME"
    echo "    $DESC"

    if [ ! -d "$SCRIPT_DIR/$SKILL_NAME" ]; then
        echo "[SKIP] Folder not found: $SKILL_NAME"
        FAILED=$((FAILED + 1))
        continue
    fi

    TARGET_DIR="$SKILLS_DIR/$SKILL_NAME"

    # Backup old version if exists
    if [ -d "$TARGET_DIR" ]; then
        BACKUP="${TARGET_DIR}_backup_$(date +%Y%m%d%H%M%S)"
        mv "$TARGET_DIR" "$BACKUP"
        echo "[BACKUP] Old version moved to backup"
    fi

    # Copy skill to target
    cp -r "$SCRIPT_DIR/$SKILL_NAME" "$TARGET_DIR"
    INSTALLED=$((INSTALLED + 1))
    echo "[DONE] Installed to $TARGET_DIR"
done

echo ""
echo "============================================================"
if [ $FAILED -eq 0 ]; then
    echo "  All $INSTALLED skills installed successfully!"
else
    echo "  $INSTALLED installed, $FAILED skipped"
fi
echo "============================================================"
echo ""
echo "Installed skills:"
for SKILL_NAME in "${!SKILL_MAP[@]}"; do
    if [ -f "$SKILLS_DIR/$SKILL_NAME/SKILL.md" ]; then
        echo "  - $SKILL_NAME"
    fi
done
echo ""
echo "Trigger words:"
echo "  product-dev-workflow     -> product development / selection / market research"
echo "  ouyun-sgrade-analysis    -> S-grade analysis / pricing / sales model"
echo "  category-prompts         -> category prompts / 4-category analysis"
echo ""
