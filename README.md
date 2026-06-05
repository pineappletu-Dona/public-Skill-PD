# 📦 Product Dev Workflow Skill

> **电商产品开发全流程** — 从市场调研到执行计划的系统化选品方法论

## ✨ 能做什么

| 阶段 | 输出 |
|------|------|
| ① 产品思维 | 产品/品牌/布局/供应四维认知框架 |
| ② 市场分析 | 关键词→站点→品类→**容量判定**→趋势→热度 |
| ③ 机会点挖掘 | **价格区间** / **品牌垄断系数** / **老品霸榜率** / 评论痛点 |
| ④ 聚焦分析 | BSR架构拆分 → 消费者偏好 → 竞品对比 → 痛点卖点 |
| ⑤ 产品定位 | 款式确认 → BOM成本 → **利润测算** → 卖点提炼 |
| ⑥ 执行计划 | 销量预估 → 定价策略 → 备货计划 |

**含 15 个核心 Excel 公式倒推还原**（SUM/COUNTIF/SUMIF/幂律模型/垄断系数等）

---

## 🚀 一键安装

### Windows（双击运行）
```bash
install.bat
```

### Mac / Linux
```bash
chmod +x install.sh && ./install.sh
```

### 手动安装
将 `product-dev-workflow` 文件夹复制到：
```
~/.workbuddy/skills/product-dev-workflow/
```

---

## 💬 如何使用（提问模板）

### 全流程分析
```
帮我做一次 [产品名] 的产品开发分析，美国站。

已知数据：
- 产品类目：[类目名]
- 目标站点：[US/UK/EU]
- 预估售价：[$xx - $xx]

请按六大阶段依次输出。
```

### 单项快速分析
```
用 product-dev-workflow 分析 [产品名] 的价格区间分布。

已知前50名 listing 价格：[粘贴数据]
```

### 已有数据代入
```
这是 [产品名] 的 Amazon US 数据：
- BSR Top10 及月销量：[数据]
- 主要品牌及份额：[数据]

请输出容量等级、最佳价格区间、垄断系数、定位建议。
```

### 触发关键词
```
产品开发 | 选品 | 市场调研 | 竞品分析 | Amazon选品 | 跨境电商选品
BSR分析 | 市场容量 | 价格区间 | 品牌分析 | 上架时间 | 评论分析
```

---

## 📁 文件结构

```
product-dev-workflow/
├── SKILL.md                          # 主流程入口（六大阶段 + 使用SOP）
├── install.bat                       # Windows 一键安装
├── install.sh                        # Mac/Linux 一键安装
└── references/
    ├── market-capacity.md            # 市场容量分析（美/英/欧标准）
    ├── price-analysis.md             # 价格区间分析方法 + 决策树
    ├── brand-analysis.md             # 品牌分析框架 + 垄断系数计算
    ├── shelf-time.md                 # 上架时间分析 + 固化/活跃判断
    └── formulas.md                   # ⭐ Excel公式倒推还原（15个核心公式）
```

---

## 🔧 技术依赖

- WorkBuddy Desktop（AI 助手平台）
- 数据采集建议配合 **卖家精灵** 或类似工具获取 BSR/销量/价格实时数据
- 本 Skill 为**纯方法论框架**，无需额外安装包

---

## 📝 版本历史

| 版本 | 日期 | 变更 |
|:----:|:----:|------|
| v1.0 | 2026-06-05 | 初始版本，含完整六阶段流程 + 15 个公式倒推 |

---

_Licensed for internal team use · Based on 腾讯开发者 Dona's product development methodology_
