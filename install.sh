#!/bin/bash
# ============================================================
#  WorkBuddy Skill 一键安装脚本 (Mac/Linux)
#  用法: chmod +x install.sh && ./install.sh
# ============================================================

set -e

SKILL_NAME="product-dev-workflow"
TARGET_DIR="$HOME/.workbuddy/skills/$SKILL_NAME"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo "============================================================"
echo "  WorkBuddy Skill 安装器 - $SKILL_NAME"
echo "============================================================"
echo ""

# 检查 skill 文件夹是否存在
if [ ! -d "$SCRIPT_DIR/$SKILL_NAME" ]; then
    echo "[错误] 找不到 $SKILL_NAME 文件夹！"
    echo "请确保本脚本与 $SKILL_NAME 文件夹在同一目录。"
    exit 1
fi

# 创建目标目录（如果不存在）
mkdir -p "$HOME/.workbuddy/skills"
echo "[创建] .workbuddy/skills 目录"

# 如果已存在旧版本，先备份
if [ -d "$TARGET_DIR" ]; then
    BACKUP="${TARGET_DIR}_backup_$(date +%Y%m%d%H%M%S)"
    mv "$TARGET_DIR" "$BACKUP"
    echo "[备份] 旧版本已移至 ${SKILL_NAME}_backup/"
fi

# 复制 skill 到目标位置
cp -r "$SCRIPT_DIR/$SKILL_NAME" "$TARGET_DIR"

echo ""
echo "[成功] ✅ $SKILL_NAME 安装完成！"
echo ""
echo "   安装路径: $TARGET_DIR"
echo "   文件清单:"
[ -f "$TARGET_DIR/SKILL.md" ] && echo     "   ├── SKILL.md (主流程)"
for f in "$TARGET_DIR"/references/*.md; do [ -f "$f" ] && echo "   └── references/$(basename $f)"; done
echo ""
echo "   触发词: 产品开发 / 选品 / 市场调研 / 竞品分析"
echo "          Amazon选品 / BSR分析 / 品牌分析 / 价格分析"
echo ""
