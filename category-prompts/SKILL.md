---
name: category-prompts
description: 19子类目（母婴5+服饰5+塑料5+中大件4）分阶段AI提示词模板库 v2.0（基础层）。每个子类目独立P0-P6全流程提示词+独有字段定义+品控阈值+数据库Schema。可直接复制给AI执行，字段定义对接tmall-scraper/MariaDB。⚠️ v3.0增强层见同目录 SKILL-v3.md（7通用增强模块+3跨阶段机制）。
agent_created: true
version: "2.0"
related_skills:
  - "product-dev-workflow → 通用6阶段框架（Amazon/跨境），含四品类差异化矩阵"
  - "category-prompts-v3 → v3.0增强层（Go/No-Go决策+数据采集手册+机会评分卡+利润模拟器+风险预案+KPI仪表盘+阶段门控）"
  - "ouyun-sgrade-market-analysis → 淘系S级深度SOP（18表/43列/定价公式/销售模型）"
  - "tmall-collector → 六平台商品数据采集（万邦API）"
tags: [电商, 提示词模板, 品类分析, 19子类目, AI执行, SOP, 数据库, MariaDB, SQL, v2.0基础层]
---

# 品类提示词模板库 v2.0（基础层）

> ⚠️ **v3.0 增强层已发布**：本文件为 v2.0 基础层（19子类目专属提示词+字段定义+阈值表）。
> v3.0 在此基础上新增 7 个通用增强模块（Go/No-Go决策/数据采集手册/机会评分卡/竞品深度拆解/全周期利润模拟器/供应链风险预案/KPI仪表盘）+ 3 个跨阶段机制（阶段门控/RACI分工/知识沉淀）。
> **v3.0 文件路径**：同目录 `SKILL-v3.md`
> **使用方式**：v2.0 子类目专属内容 + v3.0 增强模块 = 完整 v3.0 提示词

## 版本变更

| 版本 | 覆盖范围 | 提示词数量 | 特点 |
|------|----------|-----------|------|
| v1.0 | 4大类 | 24段（通用+4品类增强） | 粗粒度，子类目逻辑共享 |
| **v2.0** | **19子类目** | **133段（每子类目独立P0-P6）** | **子类目独立字段、独立阈值、DB-ready** |

## 快速导航

```
你要分析哪个子类目？
├── 🍼 母婴
│   ├── [A1] 孕产    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
│   ├── [A2] 婴童    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
│   ├── [A3] 童装    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
│   ├── [A4] 玩具    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
│   └── [A5] 喂辅    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
├── 👕 服饰
│   ├── [B1] 服装    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
│   ├── [B2] 鞋帽    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
│   ├── [B3] 内衣    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
│   ├── [B4] 家居服  → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
│   └── [B5] 配饰    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
├── 🧊 塑料
│   ├── [C1] 收纳    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
│   ├── [C2] 日用    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
│   ├── [C3] 厨房    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
│   ├── [C4] 文具    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
│   └── [C5] 园艺    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
└── 📦 中大件
    ├── [D1] 家具    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
    ├── [D2] 健身    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
    ├── [D3] 户外    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
    └── [D4] 家电    → P1市场/P2机会/P3聚焦/P4定位/P5供应链/P6执行
```

## 使用说明

### 三步使用法

```
① 确定子类目代码（如 A1 孕产）
② 确定阶段（如 P2 机会点挖掘）
③ 搜索 "# A1-P2" 定位到精确提示词段 → 复制 → 替换占位符 → 发给AI
```

### 占位符规则

所有提示词使用三个占位符：
- `{品类名称}` → 子类目名称（如"孕妇枕"）
- `{目标客群}` → 目标人群描述（如"孕中晚期妈妈"）
- `{目标平台}` → 淘系/Amazon/抖音（默认淘系）

### 数据库对接

每个子类目的"字段定义"段可直接用于：
- 建表 DDL → 参见附录 SQL Schema
- tmall-scraper 采集配置 → 参见附录 API 映射
- 数据校验规则 → 字段定义中 `required`/`validation` 标注

### 完整执行建议

使用 `Agent` 工具并行执行多个子类目的分析。每个子类目独立提示词，互不干扰：

```
并行分析：A1孕妇枕 + A2婴童睡袋 + A3童装 → 各输出独立报告
```

---

## 子类目速查矩阵

| 代码 | 子类目 | 大类 | 核心风险 | 毛利率线 | 安全库存 | 营销费比(新) | 退款率线 |
|------|--------|------|----------|---------|---------|-------------|---------|
| A1 | 孕产 | 🍼母婴 | 安全认证 | ≥32% | 50天 | 25-35% | ≤8% |
| A2 | 婴童 | 🍼母婴 | 安全合规+月龄细分 | ≥30% | 45天 | 25-35% | ≤10% |
| A3 | 童装 | 🍼母婴 | 季节库存+尺码配比 | ≥35% | 35天 | 25-30% | ≤20% |
| A4 | 玩具 | 🍼母婴 | 安全标准+IP侵权 | ≥30% | 40天 | 25-35% | ≤12% |
| A5 | 喂辅 | 🍼母婴 | 食品级认证+效期 | ≥28% | 40天 | 20-30% | ≤8% |
| B1 | 服装 | 👕服饰 | 季节库存+退货率 | ≥35% | 30天 | 25-30% | ≤25% |
| B2 | 鞋帽 | 👕服饰 | 尺码精度+退货率 | ≥35% | 35天 | 22-28% | ≤28% |
| B3 | 内衣 | 👕服饰 | Cup精度+不可退 | ≥38% | 30天 | 22-28% | ≤15% |
| B4 | 家居服 | 👕服饰 | 季节库存+面料锁定 | ≥35% | 35天 | 20-25% | ≤22% |
| B5 | 配饰 | 👕服饰 | 潮流周期+库存 | ≥40% | 25天 | 18-25% | ≤18% |
| C1 | 收纳 | 🧊塑料 | 同质化价格战 | ≥20% | 40天 | 20-30% | ≤5% |
| C2 | 日用 | 🧊塑料 | 品质客诉+同质化 | ≥20% | 40天 | 20-30% | ≤5% |
| C3 | 厨房 | 🧊塑料 | 食品级认证 | ≥22% | 40天 | 20-30% | ≤5% |
| C4 | 文具 | 🧊塑料 | 开学季集中+库存 | ≥25% | 35天 | 20-25% | ≤8% |
| C5 | 园艺 | 🧊塑料 | UV老化+季节性 | ≥22% | 40天 | 20-28% | ≤6% |
| D1 | 家具 | 📦大件 | 物流成本+安装 | ≥28% | 60天 | 20-28% | ≤8% |
| D2 | 健身 | 📦大件 | 安全认证+噪音 | ≥30% | 55天 | 22-30% | ≤10% |
| D3 | 户外 | 📦大件 | 防水/UV+季节性 | ≥30% | 50天 | 20-28% | ≤10% |
| D4 | 家电 | 📦大件 | 3C认证+售后 | ≥28% | 55天 | 20-28% | ≤8% |

---

# 第一部分：🍼 母婴品类

---

## A1: 孕产

### A1-P0: 品类定位

```
你是孕产用品品类专家。请对 {品类名称} 进行品类定位分析。

## 必答五问
1. 拉新还是复购？→ 孕产是典型的"阶段复购"品类，孕期6-9个月窗口，跨品类连带率高
2. 季节性？→ 弱季节性，但送礼节点集中（母亲节/情人节/百日宴）
3. 消费频次？→ 孕期约2-3次采购，产后约1-2次，单客生命周期短但连带SPU多
4. 客群画像？→ 孕中晚期妈妈（24-35岁），决策者=使用者，价格敏感度中等，安全敏感度极高
5. 生命周期？→ 产品使用期约3-6个月，但送礼属性拉长复购窗口

## 输出
- 品类机会评分（1-10）：___
- 关键风险清单（≥3条）
- 推荐切入角度
```

### A1-P1: 市场分析

```
你是一位母婴电商数据分析师。请对 {品类名称} 在 {目标平台} 进行完整市场大盘分析。

## A. 大盘概况（数据源：情报通BI / 生参）
1. 提取近12个月该品类月度销售额趋势，计算各月占比
2. 判断品类处于：成长期 / 成熟期 / 衰退期？
3. 识别峰值月份和谷底月份
4. 孕产品类特殊：结合出生人口数据判断品类天花板

## B. 关键词分析（数据源：生参搜索排行）
1. 提取TOP50核心搜索词及搜索人气
2. 分类：孕妇专属词 / 产后恢复词 / 送礼场景词 / 品牌词
3. 计算各词CTR和CVR中位数

## C. 安全合规扫描（孕产必做！）
1. 确认该品类的强制认证要求：A类/GB 31701/CPC/FDA/OEKO-TEX
2. 列出TOP10竞品持有的认证清单
3. 标记"认证门槛>行业平均"的品类 → 认证护城河机会

## D. 输出格式
- Markdown表格呈现
- 最后一节：3条关键结论 + 1条风险预警 + 1条认证建议
```

### A1-P2: 机会点挖掘

```
基于P1的大盘结论，对 {品类名称} 进行机会点深度挖掘。

## A. 孕期阶段空白分析（孕产专属维度）
将TOP100产品按孕期阶段分组：
- 孕早期(1-3月) / 孕中期(4-6月) / 孕晚期(7-9月) / 产后(0-6月)
- 每组输出：SKU数量/平均销量/竞争强度
- 找出"覆盖不足"的阶段 → ⭐标记机会阶段

## B. 价格带机会分析
按价格段统计TOP100：每组SKU数/平均销量/平均销售额/竞争强度
→ 找出"高销量+低竞争"的价格带，标记⭐

## C. 送礼经济分析（孕产专属）
1. 礼品属性产品占比及增速
2. 礼盒装/套装溢价率（vs 单品）
3. 送礼场景分布：满月礼/百日宴/闺蜜送礼/公司福利

## D. 评论痛点挖掘
采集Top10竞品差评(各≥50条)，词频统计Top20痛点：
- 🔴安全类(材质异味/掉毛/甲醛) → 必须避免
- 🟡功能类(支撑不足/不透气/易变形) → 改进=卖点
- 🟢场景类(送礼缺包装/尺寸不合/洗涤不便) → 蓝海

## E. 输出：《孕产机会评分卡》，每方向1-10分
```

### A1-P3: 聚焦分析

```
根据P2锁定的机会方向，对 {品类名称} 手术级聚焦。

## A. BSR/销量追踪 — Top30榜单连续4周+

## B. 规格偏好分布（孕产专属维度）
≥6维透视：
- 孕期阶段(孕早/中/晚/产后) × 功能(托腹/护腰/哺乳/塑身)
- 材质(纯棉/莫代尔/竹纤维/混纺) × 认证等级(A类/OEKO/GOTS)
- 包装形态(简装/礼盒/套装) × 价格带
- 色系(浅色/深色/印花) × 销量

## C. 竞品深度对标
选3-5款填卡片：
- 品牌/价格/孕期阶段/材质/认证/包装/Review/优劣势
- 特别标注竞品的"送礼转化设计"（如有）

## D. 卖点-痛点转化清单 ≥15条
(用户痛点→竞品现状→你的方案→话术草案)

输出：《BSR追踪表》+《多维透视报告》+《竞品卡片集》+《卖点转化清单》
```

### A1-P4: 产品定位

```
基于P1-P3全部结论，完成 {品类名称} 的产品定位方案。

## A. SKU规划
- SPU数/SKU数/优先级(主推/形象/利润/引流)
- 孕期阶段切割：是否需要区分孕早/中/晚期版本？
- SKU命名方向：情感化命名（如"孕安系列"）

## B. 成本核算明细
逐项列式：
- 材料(面料+填充物+辅料) / 加工(缝制+定型+整烫) / 包装(简装vs礼盒差价)
- 认证摊销(CPC/GB检测按批次摊销) / 检测报告 / 国内运 / 头程

## C. 定价测算（四级模型）
- 日常(系数1.0) / A级(0.9) / A+(0.88) / S级(0.85)
- 送礼溢价：礼盒版+15~25%

公式：
  到手价 = 前台价 × 折扣系数 - 优惠券
  扣点   = 到手价 × 5.5%
  毛利额 = 到手价 × (1-退款率) - 扣点 - 快递 - 成本 - 到手价 × 营销费比
  毛利率 = 毛利额 / 到手价 （目标≥32%）
  保本ROI = 1 / 毛利率

## D. 利润&ROI三情景测算（保守/中性/乐观）

## E. 差异化卖点最终版
- 主卖点1句 + 副卖点3-4条 + 信任背书(A类/OEKO/SGS检测报告)
- 送礼场景话术1套
```

### A1-P5: 供应链

```
基于P4确定的SKU和成本目标，执行 {品类名称} 供应链寻源。

## A. 供应商寻源
≥3家比价(单价/MOQ/样品费/交期/支付方式)

## B. 供应商评分(每项1-10)
价格/品质/交期/沟通/配合度/资质

## C. 孕产品类特殊验收重点
- 无异味（开袋30分钟内评测）
- 无小零件脱落风险
- 面料耐拉扯测试（模拟孕妇使用力度）
- 洗涤3次后不变形/不起球
- 认证文件现场核验（GB 31701 A类/CPC原件）
- 礼盒包装抗压测试

## D. 成本谈判
目标成本 vs 报价差距 → 降本路径(量增/工艺简/包材优/运费换)

## E. 首单采购计划
SKU/数量/单价/总金额/到仓日/供应商/付款条件

## F. 孕产专项要求
- 批次一致性条款(合同写明：下一批次必须留底对比)
- COA/SGS报告每批次必附
- 认证协同：供应商必须配合认证续期
- 留底制度：每批次留底样品3件，保存2年

产出：供应商评分表 + 样品验收报告 + 最终定价单 + 采购合同摘要
```

### A1-P6: 执行落地

```
基于P1-P5全部准备，制定 {品类名称} 上市执行方案。

## A. Listing文案方案
- 标题公式：品牌+核心卖点+孕期阶段+功能+材质+送礼属性 → 输出3版
- 五点描述：每条80-120字，埋词列表
- A+页面大纲：品牌故事→孕期痛点→解决方案→材质细节→认证展示→尺寸指南→开箱体验
- Search Terms：中文≥30 (含送礼/孕妇/孕妈/待产包等场景词)

## B. 广告计划（三阶段）
- T1冷启动(1-4周)：DMP人群包(孕妇/孕中期/孕晚期/备孕) + 竞品防御 + 送礼词测试
- T2放量(5-12周)：母婴节点投放(母亲节/双11) + 达摩盘精准人群 + 站外(小红书/抖音孕妈KOL)
- T3稳定(13周+)：砍低效词降ACOS + 布局下一代产品

## C. 库存规划表
12个月(预估销量/安全库存/在途/可售天数/补货触发)
安全库存天数：50天（孕产品类复购窗口窄但SKU多）
补货触发：可售天数 < 50天

## D. 节点营销日历
- 母亲节(T-3周启动) → 满月礼/百日宴(常态化) → 双11(集中爆发) → 春节送礼(T-4周)

## E. 周复盘模板
曝光/CTR/CVR/ACOS/自然单占比/库存周转/Review均分/退货原因分类
```

### A1 字段定义（DB-ready）

```yaml
# A1 孕产品类独有字段
subcategory: "孕产"
subcategory_code: "A1"
parent_category: "母婴"
parent_code: "A"

# P1 市场分析采集字段
p1_fields:
  - field: "pregnancy_stage"
    db_column: "pregnancy_stage"
    type: "ENUM('孕早期','孕中期','孕晚期','产后','通用')"
    description: "适用孕期阶段"
    required: true
    validation: "NOT NULL"
  - field: "gift_suitable"
    db_column: "gift_suitable_YN"
    type: "TINYINT(1)"
    description: "是否适合送礼"
    required: true
    validation: "0或1"
  - field: "cert_a_class"
    db_column: "cert_a_class_YN"
    type: "TINYINT(1)"
    description: "是否有A类认证"
    required: true
    validation: "0或1"
  - field: "cert_oeko"
    db_column: "cert_oeko_YN"
    type: "TINYINT(1)"
    description: "是否有OEKO-TEX认证"
    required: false
  - field: "cert_cpc"
    db_column: "cert_cpc_YN"
    type: "TINYINT(1)"
    description: "是否有CPC认证(跨境)"
    required: false
  - field: "gift_box_price_premium"
    db_column: "gift_box_premium_pct"
    type: "DECIMAL(5,2)"
    description: "礼盒装溢价率(%)"
    required: false
  - field: "monthly_search_volume"
    db_column: "search_vol_monthly"
    type: "INT"
    description: "月搜索人气"
    required: true

# P2 机会点挖掘字段
p2_fields:
  - field: "stage_gap_score"
    db_column: "stage_gap_score"
    type: "TINYINT"
    description: "阶段空白机会评分(1-10)"
    required: false
  - field: "gift_economy_share"
    db_column: "gift_share_pct"
    type: "DECIMAL(5,2)"
    description: "礼品属性产品占比(%)"
    required: false
  - field: "pain_point_safety_count"
    db_column: "pain_safety_cnt"
    type: "INT"
    description: "差评中安全类词频"
    required: true

# P3 聚焦分析字段
p3_fields:
  - field: "material_type"
    db_column: "material_type"
    type: "VARCHAR(50)"
    description: "主要材质(纯棉/莫代尔/竹纤维/混纺)"
    required: true
    validation: "IN('纯棉','莫代尔','竹纤维','混纺','莱赛尔','其他')"
  - field: "packaging_type"
    db_column: "packaging_type"
    type: "ENUM('简装','礼盒','套装','精装')"
    description: "包装形态"
    required: true
  - field: "filling_material"
    db_column: "filling_material"
    type: "VARCHAR(50)"
    description: "填充物类型(孕妇枕等品类)"
    required: false
  - field: "color_scheme"
    db_column: "color_scheme"
    type: "VARCHAR(100)"
    description: "色系(浅色/深色/印花)"
    required: false
  - field: "function_keyword"
    db_column: "function_keyword"
    type: "VARCHAR(200)"
    description: "功能关键词(托腹/护腰/哺乳/塑身)"
    required: true

# P4 产品定位字段
p4_fields:
  - field: "target_cost"
    db_column: "target_cost_cny"
    type: "DECIMAL(10,2)"
    description: "目标成本(元)"
    required: true
  - field: "cert_cost_per_unit"
    db_column: "cert_amortize_cny"
    type: "DECIMAL(10,4)"
    description: "认证摊销成本/件"
    required: false
  - field: "gift_box_cost"
    db_column: "gift_box_cost_cny"
    type: "DECIMAL(10,2)"
    description: "礼盒装附加成本"
    required: false
  - field: "front_price"
    db_column: "front_price_cny"
    type: "DECIMAL(10,2)"
    description: "前台标价"
    required: true
  - field: "coupon_amount"
    db_column: "coupon_cny"
    type: "DECIMAL(10,2)"
    description: "优惠券面额"
    required: false
  - field: "gross_margin_target"
    db_column: "margin_target_pct"
    type: "DECIMAL(5,2)"
    description: "目标毛利率(%)"
    required: true
    validation: ">=32"

# P5 供应链字段
p5_fields:
  - field: "supplier_batch_consistency"
    db_column: "supplier_batch_yn"
    type: "TINYINT(1)"
    description: "供应商是否承诺批次一致性"
    required: true
  - field: "supplier_odor_test"
    db_column: "odor_test_pass_YN"
    type: "TINYINT(1)"
    description: "开袋异味测试是否通过"
    required: true
  - field: "sample_wash_test"
    db_column: "wash_test_pass_YN"
    type: "TINYINT(1)"
    description: "3次洗涤测试是否通过"
    required: true
  - field: "moq_first_order"
    db_column: "moq_first_order"
    type: "INT"
    description: "首批MOQ"
    required: true
    validation: "300-500"

# P6 执行字段
p6_fields:
  - field: "dmp_tag_pregnant"
    db_column: "dmp_pregnant_YN"
    type: "TINYINT(1)"
    description: "是否使用孕妇人群包"
    required: false
  - field: "holiday_mothers_day"
    db_column: "holiday_mothers_YN"
    type: "TINYINT(1)"
    description: "是否参与母亲节营销"
    required: false
  - field: "safe_stock_days"
    db_column: "safe_stock_days"
    type: "SMALLINT"
    description: "安全库存天数"
    required: true
    validation: "50"
```

### A1 阈值表

| 指标 | 值 | 说明 |
|------|-----|------|
| 目标毛利率 | ≥32% | 高于母婴平均(30%)，认证+送礼溢价支撑 |
| 保本ROI | ≤3.1 | 1/0.32 |
| 新品营销费比 | 25-35% | 新品类目教育成本高 |
| 稳定营销费比 | 12-18% | 复购+连带降低获客成本 |
| 目标退款率 | ≤8% | 孕产客群退货意愿低 |
| 安全库存天数 | 50天 | 高于母婴平均(45)，备货周期长 |
| 备货系数 | 1.3 | 标准 |
| 首批MOQ | 300-500 | |
| 回本周期 | 3-5月 | 认证周期+市场教育 |
| 礼盒溢价率 | 15-25% | 送礼场景 |

---

## A2: 婴童

### A2-P0: 品类定位

```
你是婴童用品品类专家。请对 {品类名称} 进行品类定位分析。

## 必答五问
1. 拉新还是复购？→ 婴童是"月龄驱动复购"品类，0-3岁约4-6次换新周期
2. 季节性？→ 中弱季节性，睡袋/服装有季节，喂养类无季节
3. 消费频次？→ 高(2-5次/年)，随月龄增长需求变化
4. 客群画像？→ 宝妈（25-35岁），决策者≠使用者，安全焦虑最高
5. 生命周期？→ 单品使用期3-12月，品类连贯性高（从新生儿到幼儿）

## 输出
- 品类机会评分（1-10）：___
- 关键月龄段划分建议
- 推荐切入角度
```

### A2-P1: 市场分析

```
你是婴童品类数据分析师。请对 {品类名称} 在 {目标平台} 进行完整市场大盘分析。

## A. 大盘概况（数据源：情报通BI / 生参）
1. 提取近12个月该品类月度销售额趋势，计算各月占比
2. 判断品类处于：成长期 / 成熟期 / 衰退期？
3. 出生人口趋势对品类的影响评估

## B. 月龄段分层分析（婴童核心维度）
按以下月龄段拆分TOP100产品的销量和销售额：
- 0-3月(新生儿) / 3-6月 / 6-12月 / 12-24月 / 24-36月 / 3-6岁
- 每组标注：人均消费/产品SKU数/品牌集中度
- 输出月龄段×价格带热力图

## C. 关键词分析
1. TOP50核心搜索词（含"新生儿""婴儿""幼儿""宝宝"等月龄修饰词）
2. 分类：功能词(防惊跳/恒温/防踢被) / 月龄词 / 场景词(睡眠/出行) / 品牌词
3. 计算各词CTR和CVR中位数

## D. 决策角色链分析（婴童专属）
- 购买者(妈妈)≠使用者(宝宝)，分析两层需求差异
- 推荐者(月嫂/医生/小红书KOL)影响力评估

## E. 输出：3条关键结论 + 1条风险预警
```

### A2-P2: 机会点挖掘

```
基于P1的大盘结论，对 {品类名称} 进行机会点深度挖掘。

## A. 月龄段空白分析
将TOP100产品按目标月龄段分组统计：
→ 每组：SKU数/平均销量/竞争强度
→ 找出"覆盖不足+搜索量大"的月龄段 → ⭐机会月龄段

## B. 安全合规空白分析
1. 统计各认证持有率：A类/GB 31701/CPC/OEKO/7A抗菌
2. 找出"认证门槛高但竞品持有率低"的品类 → 认证护城河

## C. 场景空白分析（婴童专属）
- 睡眠场景 / 出行场景 / 居家场景 / 送礼场景 / 早教场景
- 各场景的产品饱和度评估

## D. 价格带机会分析
按价格段统计TOP100 → 找出⭐机会价格带

## E. 评论痛点挖掘
Top10竞品差评(各≥50条)，聚焦：
- 🔴安全(材质异味/掉毛/小零件/卡扣/甲醛)
- 🟡功能(尺码不准/不透气/不易洗/变形)
- 🟢场景(换尿布不便/外出携带/成长适配)

## F. 输出：《婴童机会评分卡》
```

### A2-P3: 聚焦分析

```
根据P2锁定的机会方向，对 {品类名称} 手术级聚焦。

## A. BSR/销量追踪 — Top30榜单连续4周+

## B. 规格偏好分布
≥6维透视：
- 月龄段 × 价格带 × 材质(纯棉/纱布/竹棉)
- 功能(防惊跳/恒温/分腿/一体/可拆袖) × 认证等级
- 包装(简装/盒装/礼盒) × 季节(四季/春夏/秋冬)
- 色系(粉/蓝/中性色/印花) × 销量

## C. 竞品深度对标
选3-5款填卡片，特别关注：
- 月龄段覆盖策略(是"一款打天下"还是"分月龄多款")
- 材质安全传达方式(认证展示/检测报告/对比实验)
- 宝妈决策触发点(痛点文案/对比图/KOL背书)

## D. 卖点-痛点转化清单 ≥15条

输出：《BSR追踪表》+《多维透视报告》+《竞品卡片集》+《卖点转化清单》
```

### A2-P4: 产品定位

```
基于P1-P3全部结论，完成 {品类名称} 的产品定位方案。

## A. SKU规划
- 月龄段切割策略：是否分0-6月/6-18月/18-36月三个版本？
- SPU数/SKU数/优先级(主推/形象/利润/引流)
- 尺码策略：偏大vs偏小（婴童尺码偏差是最大退货原因）

## B. 成本核算明细
材料/加工/包装/认证摊销/检测报告/国内运/头程
+ 安全测试费用（每批次送检SGS/ITS）

## C. 定价测算（四级模型）
目标毛利率≥30%
公式同 P4 标准公式

## D. 月龄段定价策略
- 0-6月（新生儿）：家长支付意愿最高，可定价上浮10%
- 6-18月：主力区间，竞争最激烈
- 18-36月：价格敏感度上升，需控制成本

## E. 差异化卖点
主卖点1句 + 副卖点3-4条 + 信任背书(A类/7A抗菌/检测报告)
```

### A2-P5: 供应链

```
基于P4确定的SKU，执行 {品类名称} 供应链寻源。

## A. 供应商寻源 ≥3家

## B. 婴童品类特殊验收重点
- 无小零件脱落（拉力测试≥90N）
- 无锐利边缘/尖端
- 面料pH值4.0-7.5
- 甲醛含量≤20mg/kg
- 耐唾液色牢度≥4级
- 拉链/纽扣牢固度测试
- 3次洗涤不变形

## C. 婴童专项要求
- 批次一致性（合同强制条款）
- 每批次附第三方检测报告
- 留底制度：每批次留样5件，保存3年
- 紧急召回响应时间≤24h

## D. MOQ建议：300-500

产出：供应商评分表 + 样品验收报告 + 采购合同
```

### A2-P6: 执行落地

```
基于P1-P5，制定 {品类名称} 上市执行方案。

## A. Listing文案方案
- 标题：品牌+月龄+功能+材质+安全认证 + 场景 → 3版
- 五点描述：每条80-120字，埋月龄词+功能词+安全词
- A+页面：8模块(安全承诺→月龄指南→材质详解→认证→对比→尺码→洗涤→开箱)
- Search Terms：含"新生儿""婴儿""送礼""满月"等决策触发词

## B. 广告计划
- T1：DMP人群包(宝妈/新生儿妈妈/孕期妈妈) + 竞品防御 + Vine
- T2：母婴节点 + 小红书种草 + 抖音短视频测评
- T3：稳定ROI + 季节款布局

## C. 库存规划
安全库存天数：45天
热门月龄段备货系数：1.5（需求量波动大）

## D. 节点营销
- 满月礼/百日宴(常态化) → 母亲节 → 双11/618 → 春节

## E. 周复盘模板
```

### A2 字段定义（DB-ready）

```yaml
subcategory: "婴童"
subcategory_code: "A2"
parent_category: "母婴"

p1_p2_unique_fields:
  - field: "age_range_month"
    db_column: "age_range_month"
    type: "VARCHAR(20)"
    description: "适用月龄段"
    required: true
    validation: "e.g. '0-3','3-6','6-12','12-24','24-36','36-72'"
  - field: "safety_cert_level"
    db_column: "safety_cert_level"
    type: "ENUM('A类','B类','C类','OEKO','GOTS','CPC','7A抗菌','无')"
    description: "安全认证等级"
    required: true
  - field: "scene_tag"
    db_column: "scene_tag"
    type: "VARCHAR(100)"
    description: "使用场景标签(睡眠/出行/居家/送礼/早教)"
    required: true
  - field: "anti_shock_design"
    db_column: "anti_shock_YN"
    type: "TINYINT(1)"
    description: "防惊跳设计"
    required: false
  - field: "constant_temp"
    db_column: "constant_temp_YN"
    type: "TINYINT(1)"
    description: "恒温功能"
    required: false
  - field: "split_leg_design"
    db_column: "split_leg_YN"
    type: "TINYINT(1)"
    description: "分腿设计"
    required: false
  - field: "ph_value"
    db_column: "ph_value"
    type: "DECIMAL(3,1)"
    description: "面料pH值"
    required: true
    validation: "4.0-7.5"
  - field: "formaldehyde_mgkg"
    db_column: "formaldehyde_mgkg"
    type: "DECIMAL(5,1)"
    description: "甲醛含量(mg/kg)"
    required: true
    validation: "<=20"
  - field: "color_fastness_saliva"
    db_column: "color_fast_saliva"
    type: "TINYINT"
    description: "耐唾液色牢度(级)"
    required: true
    validation: ">=4"
  - field: "pull_test_newton"
    db_column: "pull_test_N"
    type: "DECIMAL(5,1)"
    description: "小零件拉力测试(N)"
    required: true
    validation: ">=90"

p4_p6_unique_fields:
  - field: "age_premium_pct"
    db_column: "age_premium_pct"
    type: "DECIMAL(5,2)"
    description: "新生儿段溢价率(%)"
    required: false
  - field: "safety_video_url"
    db_column: "safety_video_url"
    type: "VARCHAR(500)"
    description: "安全测评视频链接"
    required: false
  - field: "batch_retain_sample_count"
    db_column: "batch_retain_sample_cnt"
    type: "SMALLINT"
    description: "每批次留样数量"
    required: true
    validation: ">=5"
```

### A2 阈值表

| 指标 | 值 | 说明 |
|------|-----|------|
| 目标毛利率 | ≥30% | 母婴基准线 |
| 保本ROI | ≤3.3 | |
| 新品营销费比 | 25-35% | DMP精准人群可降CPC |
| 稳定营销费比 | 12-18% | |
| 目标退款率 | ≤10% | 尺码偏差是主因 |
| 安全库存天数 | 45天 | |
| 备货系数 | 1.3(常规)/1.5(热销月龄) | |
| 首批MOQ | 300-500 | |
| 回本周期 | 3-4月 | |
| 新生儿段溢价 | 10-15% | |

---

## A3: 童装

### A3-P0: 品类定位

```
你是童装品类专家。请对 {品类名称} 进行品类定位分析。

## 必答五问
1. 拉新还是复购？→ 童装是"高复购+高拉新"，年增长驱动换新，风格吸引新客
2. 季节性？→ 强季节！春秋装=主力，季节提前量约T-8周
3. 消费频次？→ 中高(4-8套/年)，受身高增长+季节+社交驱动
4. 客群画像？→ 宝妈(25-35)，决策受小红书/抖音KOL影响大，颜值敏感
5. 生命周期？→ 单品使用3-9月（身高速长期），码段连续性很重要

## 核心铁律（必记）
- 首波SKU ≤3色×≤4码 = ≤12SKU，先测款再扩码
- 退货率20-25%是正常的，尺码不准+实物色差是Top2退货原因
- 换季提前T-10周开始投放，T-6周备货到位
```

### A3-P1: 市场分析

```
你是童装数据分析师。请对 {品类名称} 在 {目标平台} 进行市场大盘分析。

## A. 大盘概况
1. 近12个月月度销售额趋势+月占比
2. 品类阶段判断+出生人口影响评估
3. 风格趋势扫描（当前流行：新中式/Trendy/Kids/Y2K/学院风？）

## B. 季节性波动模型（童装核心）
1. 按季节拆分：春夏(3-5月)/夏季(6-8月)/秋冬(9-11月)/冬季(12-2月)
2. 各季节贡献占比，提前量建议
3. 输出《季节备货节奏表》：每月要上什么款、达什么量

## C. 尺码段分布分析
- 73/80/90/100/110/120/130/140 各码段销量占比
- 主流码段(如90-120)竞争强度评估
- 大码段(130+)和小码段(73-80)的机会空间

## D. 关键词分析
TOP50词 + 风格词 + 场景词(幼儿园/外出/居家/运动)

## E. 输出：3条结论 + 1条风格趋势预警
```

### A3-P2: 机会点挖掘

```
基于P1，对 {品类名称} 进行机会点挖掘。

## A. 风格空白分析
1. TOP50产品按风格聚类：学院/运动/甜美/潮酷/简约/国风
2. 每种风格的平均售价/平均销量/竞品数量
3. 找出"搜索高但供给少"的风格 → ⭐机会风格

## B. 尺码空白分析
- 各码段84/90/100/110/120/130/140的商品饱和度
- 大码段(130+)搜索vs供给gap → 蓝海机会

## C. 季节+风格交叉分析
- 如"春秋+国风"vs"夏季+运动"的饱和度对比

## D. 价格带机会分析
按价格段统计TOP100

## E. 评论痛点挖掘
Top10竞品差评，聚焦：
- 🔴尺码(偏大/偏小/码不准) — 最大痛点
- 🔴色差(实物与图片差异大)
- 🟡面料(起球/缩水/不透气)
- 🟢设计(不够可爱/不够潮/搭配难)

## F. 输出：《童装机会评分卡》
```

### A3-P3: 聚焦分析

```
根据P2，对 {品类名称} 手术级聚焦。

## A. BSR追踪 Top30 × 4周

## B. 规格偏好透视（≥6维）
- 风格 × 季节 × 尺码段 × 价格带
- 面料(纯棉/棉混纺/莫代尔/灯芯绒) × 版型(宽松/修身/A字)
- 色系(粉/蓝/白/卡其/印花) × 销量
- 设计元素(荷叶边/刺绣/贴布/蕾丝) × 加购率

## C. 竞品深度对标 5-8款（广度看趋势）
卡片：品牌/价格/风格/材质/尺码覆盖/主图风格/Review/退货率推测

## D. 卖点-痛点转化清单 ≥15条
特别注意"实物与期望差距"（童装复购杀手）

输出：BSR表+透视报告+竞品卡片+卖点清单
```

### A3-P4: 产品定位

```
基于P1-P3，完成 {品类名称} 产品定位。

## A. SKU规划（铁律控制）
- 首波≤3色×≤4码=≤12SKU
- 主推1色+引流1色+利润1色
- 尺码策略：偏大5%（预留成长空间）减少退货

## B. 成本核算
材料(面料+辅料+装饰件)+加工(缝制+印花/刺绣)+包装+检测+运输
+面料锁定费用(每色留底1米)

## C. 定价测算
目标毛利率≥35%（童装退货率高压低毛利）
公式同标准

## D. 换季成本考量
过季库存折损率：季末7折→跨季5折→两年清仓

## E. 卖点提炼
主卖点+面料卖点+设计卖点+穿搭推荐
```

### A3-P5: 供应链

```
## A. 供应商寻源 ≥3家

## B. 童装专项验收
- 面料锁定：首批大货与留底样品对比（色差/手感/克重）
- 色牢度：耐水洗≥4级/耐摩擦≥4级/耐汗渍≥4级/耐光照≥4级
- 尺寸公差：关键部位±1cm
- A等品率≥95%
- 儿童安全：绳带长度/小附件拉力

## C. 合同专项
- 面料锁定条款（换面料视为违约）
- 次品率约定（超过5%退货）
- 色差容差标准
- 急单响应时间≤7天

## D. MOQ：150-300/色（低于母婴平均，减少库存风险）
```

### A3-P6: 执行落地

```
## A. Listing
- 标题：品牌+风格+品类+面料+季节+尺码 → 3版
- 五点：尺码建议(重要！)+面料舒适+设计亮点+穿搭场景+洗护说明
- 首屏核心：尺码表(强化！)+多角度试穿图+面料细节图
- A+：风格故事→面料细节→尺码指南→搭配推荐→场景展示→洗护

## B. 广告计划（季节铁律）
- 铁律：T-10周开始预热投放！T-6周备货到位！
- T1：DMP宝妈+月龄人群+风格兴趣标签 + 竞品防御
- T2：小红书种草穿搭 + 抖音童装测评
- T3：换季清仓(提前2周阶梯降价)

## C. 库存规划
- 热门码(90-110)：安全库存30天/备货系数1.5
- 冷门码(73-80, 130+)：安全库存15天/备货系数1.0

## D. 换季节奏
- 春季款：1月上→春节后爆发
- 夏季款：3月预热→4-5月高峰
- 秋季款：7月预热→8-9月高峰
- 冬季款：9月预热→10-11月高峰

## E. 周复盘
+ 尺码退货分析（哪个码段退货最高？）
+ 色差客诉追踪
```

### A3 字段定义（DB-ready）

```yaml
subcategory: "童装"
subcategory_code: "A3"

p1_p3_unique_fields:
  - field: "style_tag"
    db_column: "style_tag"
    type: "ENUM('学院','运动','甜美','潮酷','简约','国风','休闲','公主','其他')"
    description: "风格标签"
    required: true
  - field: "season_tag"
    db_column: "season_tag"
    type: "ENUM('春夏','夏季','秋冬','冬季','四季')"
    description: "季节标签"
    required: true
  - field: "size_range"
    db_column: "size_range"
    type: "VARCHAR(50)"
    description: "尺码覆盖范围(e.g. '90-130')"
    required: true
  - field: "size_count"
    db_column: "size_count"
    type: "TINYINT"
    description: "尺码数量"
    required: true
    validation: "首波≤4"
  - field: "color_count"
    db_column: "color_count"
    type: "TINYINT"
    description: "颜色数量"
    required: true
    validation: "首波≤3"
  - field: "fabric_composition"
    db_column: "fabric_composition"
    type: "VARCHAR(200)"
    description: "面料成分及占比"
    required: true
  - field: "fabric_weight_gsm"
    db_column: "fabric_weight_gsm"
    type: "SMALLINT"
    description: "面料克重(g/m2)"
    required: false
  - field: "color_fastness_wash"
    db_column: "color_fast_wash"
    type: "TINYINT"
    description: "耐水洗色牢度(级)"
    required: true
    validation: ">=4"
  - field: "design_element"
    db_column: "design_element"
    type: "VARCHAR(200)"
    description: "设计元素(荷叶边/刺绣/贴布等)"
    required: false
  - field: "return_rate_estimate"
    db_column: "return_rate_est_pct"
    type: "DECIMAL(5,2)"
    description: "退货率预估(%)"
    required: true
    validation: "20-25%为正常"

p5_unique_fields:
  - field: "a_grade_rate"
    db_column: "a_grade_rate_pct"
    type: "DECIMAL(5,2)"
    description: "A等品率(%)"
    required: true
    validation: ">=95"
  - field: "fabric_lock_clause"
    db_column: "fabric_lock_YN"
    type: "TINYINT(1)"
    description: "面料锁定条款"
    required: true
  - field: "rapid_order_days"
    db_column: "rapid_order_days"
    type: "TINYINT"
    description: "急单响应时间(天)"
    required: true
    validation: "<=7"
```

### A3 阈值表

| 指标 | 值 | 说明 |
|------|-----|------|
| 目标毛利率 | ≥35% | 退货率高需要毛利空间 |
| 保本ROI | ≤2.9 | |
| 首波SKU上限 | ≤3色×≤4码=≤12 | 铁律！ |
| 新品营销费比 | 25-30% | |
| 稳定营销费比 | 10-15% | |
| 目标退款率 | ≤20% | 童装正常范围 |
| 安全库存天数(热门码) | 30天 | |
| 安全库存天数(冷门码) | 15天 | |
| 备货系数(热门码) | 1.5 | |
| 季节提前量 | T-10周投放 / T-6周备货 | 铁律！ |
| 首批MOQ | 150-300/色 | |
| 回本周期 | 2-3月 | |
| 过季折损率 | 季末7折/跨季5折 | |

---

## A4: 玩具

### A4-P0: 品类定位

```
你是玩具品类专家。请对 {品类名称} 进行品类定位分析。

## 必答五问
1. 拉新还是复购？→ 玩具是"IP驱动拉新+教育驱动复购"，节日爆发明显
2. 季节性？→ 中弱（节日集中），6/1儿童节+双11+春节是三大高峰
3. 消费频次？→ 中(2-4件/年)，节日/生日/奖励驱动
4. 客群画像？→ 宝妈(25-35)+送礼人群，教育价值>价格
5. 生命周期？→ 单品活跃期1-2年(潮流迭代)，经典款可长青

## 核心风险
- IP侵权（最高风险！）→ 所有设计元素必须查IP
- 3C认证 → 必须持有
- 小零件窒息风险 → 年龄标识必须准确
```

### A4-P1: 市场分析

```
你是玩具品类数据分析师。请对 {品类名称} 进行市场大盘分析。

## A. 大盘概况
1. 近12个月月度销售趋势+月占比
2. 节日峰值量化(61/双11/春节各占全年%)
3. 品类阶段判断

## B. 教育/IP价值分层（玩具核心维度）
1. 教育价值层级：纯娱乐 / 早教启蒙 / STEAM / 编程
2. IP类型分布：原创IP / 授权IP / 公共IP(动物/数字/字母)
3. 各层级价格带和溢价率

## C. 月龄/年龄分层
- 0-6月 / 6-12月 / 1-2岁 / 2-3岁 / 3-6岁 / 6岁+
- 每个年龄段的畅销品类和产品形态

## D. 安全认证扫描
- 3C认证覆盖率/CE/ASTM/EN71
- 认证等级与客单价的相关性分析

## E. 关键词分析
TOP50词+教育词+IP词+节日词

## F. 输出：3条结论+1条IP风险预警
```

### A4-P2: 机会点挖掘

```
基于P1，对 {品类名称} 进行机会点挖掘。

## A. 教育维度空白分析
- 纯娱乐/早教/STEAM/编程各层级的产品饱和度
- 交叉分析：年龄×教育层级×价格带

## B. IP机会分析
- 当前TOP IP有哪些？授权费占比？
- 公共IP(无授权费)的潜力评估
- 原创IP孵化可行性

## C. 节日场景空白
- 送礼包装需求 vs 市场供给
- 礼盒装溢价空间

## D. 价格带机会分析

## E. 评论痛点
- 🔴安全(小零件脱落/尖角/材质异味)
- 🔴耐用性(易坏/电池不耐用/掉色)
- 🟡教育效果(描述与实际不符)
- 🟢场景(收纳不便/配件易丢/清洁困难)

## F. 输出：《玩具机会评分卡》
```

### A4-P3: 聚焦分析

```
根据P2，对 {品类名称} 手术级聚焦。

## A. BSR追踪 Top30 × 4周

## B. 规格偏好透视（≥6维）
- 年龄 × 教育层级 × 功能(拼搭/声光/运动/角色扮演)
- 材质(塑料/木制/布艺/硅胶) × 安全等级
- IP类型 × 价格带 × 包装(简装/彩盒/礼盒)
- 尺寸(迷你/标准/大型) × 销量

## C. 竞品深度对标 3-5款
卡片特别关注：IP来源/教育卖点传达/安全认证展示/开箱体验

## D. 卖点-痛点转化清单 ≥15条

输出：BSR表+透视报告+竞品卡片+卖点清单
```

### A4-P4: 产品定位

```
基于P1-P3，完成 {品类名称} 产品定位。

## A. SKU规划
- 教育线(强调学习效果)+娱乐线(强调趣味)
- 主推+引流+利润SKU
- 礼盒版vs单品版

## B. 成本核算
材料+加工+包装+3C认证摊销+IP授权费(如有)
IP授权费通常占成本5-15%，需摊入每件

## C. 定价测算
目标毛利率≥30%
IP授权产品需加IP溢价系数(1.1-1.3)
公式同标准

## D. 教育/娱乐双线定价
- 教育线：可溢价15-25%（家长教育投资心态）
- 娱乐线：对标市场均价，依靠设计和IP差异化

## E. 差异化卖点+开箱体验设计
```

### A4-P5: 供应链

```
## A. 供应商寻源 ≥3家

## B. 玩具专项验收
- 3C认证原件核验（杜绝假证！）
- 小零件拉力测试≥90N
- 跌落测试(1.4m高处跌落3次)
- 电池仓防儿童开启设计
- 材质：无异味/无BPA/无邻苯
- 表面涂装：耐唾液/耐汗渍
- 声光玩具：音量≤85dB

## C. 合同专项
- 3C认证有效性保证（假证赔3倍货款）
- 批次一致性+留底
- 设计知识产权归属

## D. MOQ：300-500
```

### A4-P6: 执行落地

```
## A. Listing
- 标题：品牌+教育/IP+年龄+功能+材质+认证 → 3版
- 五点：教育价值+安全认证+玩法介绍+适用年龄+送礼推荐
- 首屏：安全认证标识+玩法GIF/视频+开箱展示
- A+：教育理念→玩法演示→安全认证→材质对比→适用年龄指南→开箱体验

## B. 广告
- T1：DMP宝妈+月龄+教育兴趣 + 竞品防御
- T2：节日(61/双11/春节)集中爆发 + KOL测评视频
- T3：稳定ROI

## C. 库存
安全库存：40天
节日前30天备货到位

## D. 节点营销
61儿童节(T-4周)→双11(T-3周)→春节送礼(T-4周)→平日(内容种草)

## E. 周复盘+IP预警监控
```

### A4 字段定义（DB-ready）

```yaml
subcategory: "玩具"
subcategory_code: "A4"

unique_fields:
  - field: "age_range"
    db_column: "age_range"
    type: "VARCHAR(20)"
    description: "适用年龄"
    required: true
  - field: "education_level"
    db_column: "education_level"
    type: "ENUM('纯娱乐','早教','STEAM','编程','音乐','艺术','语言')"
    description: "教育价值层级"
    required: true
  - field: "ip_type"
    db_column: "ip_type"
    type: "ENUM('原创IP','授权IP','公共IP','无IP')"
    description: "IP类型"
    required: true
  - field: "ip_owner"
    db_column: "ip_owner"
    type: "VARCHAR(100)"
    description: "IP权利方(授权IP必填)"
    required: false
  - field: "ip_royalty_pct"
    db_column: "ip_royalty_pct"
    type: "DECIMAL(5,2)"
    description: "IP授权费占比(%)"
    required: false
  - field: "cert_3c"
    db_column: "cert_3c_YN"
    type: "TINYINT(1)"
    description: "3C认证"
    required: true
  - field: "small_parts_risk"
    db_column: "small_parts_risk_YN"
    type: "TINYINT(1)"
    description: "是否存在小零件风险"
    required: true
  - field: "volume_db"
    db_column: "volume_db"
    type: "TINYINT"
    description: "最大音量(dB)"
    required: false
    validation: "<=85"
  - field: "play_mode"
    db_column: "play_mode"
    type: "VARCHAR(100)"
    description: "玩法类型(拼搭/声光/运动/角色扮演/益智)"
    required: true
  - field: "holiday_share_pct"
    db_column: "holiday_share_pct"
    type: "DECIMAL(5,2)"
    description: "节日销售占比预估(%)"
    required: false
```

### A4 阈值表

| 指标 | 值 | 说明 |
|------|-----|------|
| 目标毛利率 | ≥30% | 含IP授权费摊销 |
| 保本ROI | ≤3.3 | |
| 新品营销费比 | 25-35% | 节日集中投放 |
| 稳定营销费比 | 12-18% | |
| 目标退款率 | ≤12% | |
| 安全库存天数 | 40天 | |
| 节日备货提前 | 30天 | |
| 首批MOQ | 300-500 | |
| 回本周期 | 3-4月 | |
| IP溢价系数 | 1.1-1.3 | |
| 教育线溢价 | 15-25% | |

---

## A5: 喂辅

### A5-P0: 品类定位

```
你是喂辅品类专家。请对 {品类名称} 进行品类定位分析。

## 必答五问
1. 拉新还是复购？→ 喂辅是"高复购+订阅属性"品类，消耗品逻辑
2. 季节性？→ 无季节性，全年稳定
3. 消费频次？→ 极高(按月购买)，奶粉/辅食/营养品按月消耗
4. 客群画像？→ 宝妈(25-35)，食品级焦虑最高，品牌信任第一位
5. 生命周期？→ 0-3岁为主，配方/辅食分阶段切换

## 核心风险
- 不是母婴玩具，是**食品级管控**！
- SC食品生产许可证+营养成分检测+过敏原声明+效期管理
- 一次食安事故=品牌死亡
```

### A5-P1: 市场分析

```
你是喂辅品类数据分析师。请对 {品类名称} 进行市场大盘分析。

## A. 大盘概况
1. 近12个月月度销售趋势+月占比（喂辅无季节性波动）
2. 判断品类阶段

## B. 月龄×配方分层（喂辅核心维度）
按以下维度拆分：
- 月龄段：0-6月(配方奶)/4-6月(初添辅食)/6-12月(多样化)/12-36月(家庭化)
- 品类细分：奶粉/米粉/果泥/肉泥/面条/零食/营养品
- 每组：市场份额/均价/品牌集中度/客单价

## C. 配方/成分趋势
- 有机/非转基因/无添加糖/无盐/DHA添加/益生菌/乳铁蛋白
- 各成分趋势的搜索量变化

## D. 关键词分析
TOP50词+成分词+月龄词+品牌词

## E. 监管/合规扫描（必做！）
- GB 10765/10767/10769/22570 适用标准确认
- 营养成分表强制标注项目
- 过敏原声明要求

## F. 输出：3条结论+1条法规风险预警
```

### A5-P2: 机会点挖掘

```
基于P1，对 {品类名称} 进行机会点挖掘。

## A. 配方空白分析
- 有机/无糖/无盐/低敏等细分市场饱和度
- 成分升级路径（如"米粉→强化铁米粉→有机强化铁米粉"）

## B. 订阅/套组模式机会
- 月度订阅盒的可行性
- 月龄分阶段套组（4-6月/6-12月/12+月）

## C. 月龄段空白
- 各月龄段的产品覆盖密度

## D. 价格带机会分析

## E. 评论痛点
- 🔴安全(过敏/成分不符/变味/异物/包装破损)
- 🔴效期(临期/过期)
- 🟡口感(宝宝不吃/太甜/太淡)
- 🟢体验(冲调不便/包装难开/量不够)

## F. 输出：《喂辅机会评分卡》
```

### A5-P3: 聚焦分析

```
根据P2，对 {品类名称} 手术级聚焦。

## A. BSR追踪 Top30 × 4周

## B. 规格偏好透视（≥6维）
- 月龄 × 品类(米粉/果泥/零食) × 配方特征(有机/无糖/DHA)
- 包装(罐装/袋装/小包装/组合装) × 克重
- 认证(有机/SC/ISO22000/HACCP) × 价格带
- 品牌信任度(成立年限/检测报告/达人推荐) × 复购率

## C. 竞品深度对标 3-5款
卡片特别关注：配方表透明度/检测报告公开/过敏原标注/效期管理/品牌故事

## D. 卖点-痛点转化清单 ≥15条
特别注意：信任建立（检测报告/医生推荐/原料溯源）

输出：BSR表+透视报告+竞品卡片+卖点清单
```

### A5-P4: 产品定位

```
基于P1-P3，完成 {品类名称} 产品定位。

## A. SKU规划
- 分月龄段产品线
- 单包装/组合装/订阅盒
- 引流品+利润品+信任品(检测报告公开款)

## B. 成本核算
原料+加工(SC食品工厂)+包装(食品级)+检测(每批次)+认证摊销+运输
+效期损耗成本(过期退货/销毁)

## C. 定价测算
目标毛利率≥28%（食品原料成本占比高，但复购率极高）
公式同标准

## D. 效期管理成本
- 生产日期 → 到仓日期gap控制
- 货架期预留(≥6个月才算新鲜)
- 临期处理方案(提前2月促销)

## E. 差异化卖点+信任体系
- 配方差异化(有机/低敏/功能强化)
- 信任体系：原料溯源/检测报告每批次公开/医生背书
```

### A5-P5: 供应链

```
## A. 供应商寻源 ≥3家（必须具备SC证！）

## B. 喂辅专项验收（食品级标准！）
- SC食品生产许可证原件核验
- 每批次出厂检验报告
- 营养成分表实测与标签对比（误差≤20%）
- 微生物指标：菌落总数/大肠菌群/沙门氏菌/金黄色葡萄球菌
- 重金属：铅/砷/汞/镉
- 过敏原检测
- 保质期加速测试

## C. 合同专项
- SC证有效性保证
- 每批次全项目检测报告
- 食品安全责任险
- 召回机制（发现问题24h启动）
- 效期保证：到仓生产日期≤30天前

## D. MOQ：按品类，500-2000（食品级起订量高）
```

### A5-P6: 执行落地

```
## A. Listing
- 标题：品牌+月龄+品类+核心成分+认证 → 3版
- 五点：配方亮点+营养成分+安全认证+食用方法+品牌信任
- 首屏：检测报告截图+营养成分表+原料溯源图
- A+：品牌故事→配方理念→营养成分→安全检测→食用指南→FAQ

## B. 广告
- T1：DMP宝妈+月龄+配方兴趣 + 竞品防御
- T2：医生/KOL背书 + 种草内容
- T3：复购提醒+订阅推广

## C. 库存（效期敏感！）
安全库存：40天（不能多，效期会过期）
补货触发：可售天数<30天
临期预警：效期≤6月启动促销

## D. 节点营销
- 无强节日属性，但双11/618可做大促
- 日常运营：内容种草+复购提醒

## E. 周复盘+效期追踪
```

### A5 字段定义（DB-ready）

```yaml
subcategory: "喂辅"
subcategory_code: "A5"

unique_fields:
  - field: "age_range_month"
    db_column: "age_range_month"
    type: "VARCHAR(20)"
    description: "适用月龄段"
    required: true
  - field: "product_subtype"
    db_column: "product_subtype"
    type: "ENUM('奶粉','米粉','果泥','肉泥','面条','零食','营养品','辅食油','其他')"
    description: "喂辅品类细分"
    required: true
  - field: "sc_license_no"
    db_column: "sc_license_no"
    type: "VARCHAR(50)"
    description: "SC食品生产许可证编号"
    required: true
  - field: "organic_cert"
    db_column: "organic_YN"
    type: "TINYINT(1)"
    description: "有机认证"
    required: false
  - field: "sugar_added"
    db_column: "sugar_added_YN"
    type: "TINYINT(1)"
    description: "是否添加糖"
    required: true
  - field: "salt_added"
    db_column: "salt_added_YN"
    type: "TINYINT(1)"
    description: "是否添加盐"
    required: true
  - field: "allergen_list"
    db_column: "allergen_list"
    type: "VARCHAR(500)"
    description: "过敏原成分列表"
    required: true
  - field: "shelf_life_days"
    db_column: "shelf_life_days"
    type: "SMALLINT"
    description: "保质期(天)"
    required: true
  - field: "nutrition_facts"
    db_column: "nutrition_facts"
    type: "TEXT"
    description: "营养成分表(JSON)"
    required: true
  - field: "microorganism_standard"
    db_column: "microorganism_std"
    type: "VARCHAR(200)"
    description: "微生物指标标准"
    required: true
  - field: "heavy_metal_test"
    db_column: "heavy_metal_YN"
    type: "TINYINT(1)"
    description: "重金属检测"
    required: true
  - field: "food_safety_insurance"
    db_column: "food_safety_ins_YN"
    type: "TINYINT(1)"
    description: "食品安全责任险"
    required: true
  - field: "recall_response_hours"
    db_column: "recall_response_hrs"
    type: "TINYINT"
    description: "召回响应时间(h)"
    required: true
    validation: "<=24"
  - field: "production_to_warehouse_days"
    db_column: "prod_to_wh_days"
    type: "SMALLINT"
    description: "生产到入仓天数"
    required: true
    validation: "<=30"
```

### A5 阈值表

| 指标 | 值 | 说明 |
|------|-----|------|
| 目标毛利率 | ≥28% | 食品原料成本高，复购率高弥补 |
| 保本ROI | ≤3.6 | |
| 新品营销费比 | 20-30% | 信任教育成本高 |
| 稳定营销费比 | 10-15% | |
| 目标退款率 | ≤8% | 食品类退货率低 |
| 安全库存天数 | 40天 | 效期敏感不能多 |
| 效期预留 | ≥6个月 | 到消费者手上前效期 |
| 生产到入仓 | ≤30天 | |
| 首批MOQ | 500-2000 | |
| 回本周期 | 3-5月 | |
| SC认证要求 | 必须 | 食品级底线 |
| 重金属检测 | 必须每批次 | |

---

# 第二部分：👕 服饰品类

---

## B1: 服装

### B1-P0: 品类定位

```
你是服装品类专家。请对 {品类名称} 进行品类定位分析。

## 必答五问
1. 拉新还是复购？→ 服装是"风格驱动拉新+季节驱动复购"，两者各半
2. 季节性？→ 极强！季节提前T-10周，错过等于全年报废
3. 消费频次？→ 中高(4-8件/年)，风格/季节/社交驱动
4. 客群画像？→ {目标客群}，小红书+抖音穿搭种草是核心决策路径
5. 生命周期？→ 单季3-4月，经典款可跨季

## 核心铁律
- 首波SKU ≤3色×≤4码=≤12SKU（先测款再扩！）
- 退货率22-25%是行业正常值，尺码不准+色差=Top2退货原因
- 换季投放：T-10周预热，T-6周备货到位
- SKU爆炸=库存灾难，严格控制变体数量
```

### B1-P1: 市场分析

```
你是服装品类数据分析师。请对 {品类名称} 在 {目标平台} 进行市场大盘分析。

## A. 大盘概况
1. 近12个月月度销售趋势+月占比
2. 品类阶段判断
3. 当前主流风格趋势扫描

## B. 季节波动模型（服装核心）
1. 按季节拆解：春夏/夏季/秋冬/冬季
2. 各季节销售贡献占比
3. 输出《季节备货节奏表》：每月什么款/什么时候上/什么时候清
4. 计算提前量：投放提前T-10周，备货提前T-6周

## C. 款式×面料透视
- TOP50产品的版型分布(宽松/修身/直筒/A字/oversize)
- 面料分布(纯棉/棉混纺/涤纶/麻/羊毛/天丝)
- 色系分布(基础色/流行色/印花)

## D. 退货率趋势分析
- 该品类行业退货率基准
- 退货原因TOP3：尺码/色差/面料不符

## E. 关键词分析
TOP50词+风格词+场景词+季节词

## F. 输出：3条结论+1条季节风险预警
```

### B1-P2: 机会点挖掘

```
基于P1，对 {品类名称} 进行机会点挖掘。

## A. 风格空白分析
1. TOP50产品按风格聚类（韩系/日系/欧美/国潮/极简/法式/学院/运动）
2. 每种风格的饱和度+平均售价+平均销量
3. 找出"搜索增长快+供给不足"的风格 → ⭐机会风格

## B. 尺码空白分析
- 每码段(XS/S/M/L/XL/2XL/大码)商品数和销量
- 大码(2XL+)搜索量vs供给量 → 蓝海信号

## C. 面料功能空白
- 防晒/凉感/抗菌/免烫/防水等功能面料的渗透率
- 找出"需求高但供给少"的功能面料

## D. 价格带机会分析

## E. 评论痛点
- 🔴尺码(偏大/偏小/版型不对) → 最大痛点
- 🔴色差(实物vs图片/批次色差)
- 🟡面料(起球/缩水/透/洗后变形)
- 🟢穿搭(不会搭配/缺少搭配参考)

## F. 输出：《服装机会评分卡》
```

### B1-P3: 聚焦分析

```
根据P2，对 {品类名称} 手术级聚焦。

## A. BSR追踪 Top30 × 4周

## B. 规格偏好透视（≥6维）
- 风格 × 版型 × 尺码段 × 面料 × 色系 × 季节
- 价格带 × 销量 × 加购率
- 设计元素(领型/袖型/口袋/拉链/纽扣) × 流行度

## C. 竞品深度对标 5-8款
卡片：品牌/风格/价格/版型/面料/尺码覆盖/主图风格/Review/退货率推测

## D. 卖点-痛点转化清单 ≥15条
特别注意"尺码不准"和"实物与图片差距"两个核心退货驱动力

输出：BSR表+透视报告+竞品卡片+卖点清单
```

### B1-P4: 产品定位

```
基于P1-P3，完成 {品类名称} 产品定位。

## A. SKU规划（铁律！）
- 首波≤3色×≤4码=≤12SKU
- 主推色1+引流色1+利润色1
- 版型选择：1-2版型（如一件宽松+一件修身）
- 尺码策略：给出尺码建议表减少退货

## B. 成本核算
面料+辅料(拉链/纽扣/松紧)+加工(裁剪+缝制+整烫+包装)+检测+运输
+面料锁定费用(每色留底1米)
+次品率约定(超过5%退货)

## C. 定价测算
目标毛利率≥35%
公式同标准
过季产品处理成本(季末7折/跨季5折)需预留

## D. 卖点提炼
主卖点(风格/设计)+面料卖点+版型卖点+穿搭推荐

## E. 退货压降措施
- 尺码指南视频+真人多身高试穿
- 面料细节大图+手感描述
- 色差提示(不同光线/屏幕下的颜色)
```

### B1-P5: 供应链

```
## A. 供应商寻源 ≥3家

## B. 服装专项验收
- 面料锁定：大货与留底样品对比
- 色牢度：耐水洗≥4/耐摩擦≥4/耐汗渍≥4/耐光照≥4
- 尺寸公差：关键部位±1cm
- 线迹质量/缝制强度
- A等品率≥95%

## C. 合同专项
- 面料锁定(换料违约)
- 色差容差标准
- 次品率≤5%
- 急单响应≤7天

## D. MOQ：150-300/色
```

### B1-P6: 执行落地

```
## A. Listing
- 标题：品牌+风格+品类+面料+场景+季节 → 3版
- 五点：风格设计+面料舒适+版型亮点+穿搭场景+尺码建议
- 首屏：多角度真人试穿+尺码对比表+面料细节+搭配推荐
- A+：风格故事→面料→版型→尺码指南→搭配→场景→洗护

## B. 广告（季节铁律）
- 铁律：T-10周开始预热！T-6周备货到位！
- T1：DMP风格+年龄+消费力人群 + 竞品防御
- T2：小红书穿搭种草 + 抖音穿搭测评
- T3：换季清仓

## C. 库存（尺码敏感）
- 热门码(M/L)：安全30天/系数1.3
- 冷门码(XS/2XL+)：安全15天/系数1.0

## D. 换季节奏
春季1月上/夏季3月预热/秋季7月预热/冬季9月预热

## E. 周复盘+尺码退货分析
```

### B1 字段定义（DB-ready）

```yaml
subcategory: "服装"
subcategory_code: "B1"
parent_category: "服饰"

p1_p3_unique_fields:
  - field: "style_tag"
    db_column: "style_tag"
    type: "ENUM('韩系','日系','欧美','国潮','极简','法式','学院','运动','通勤','休闲','其他')"
    description: "风格标签"
    required: true
  - field: "fit_type"
    db_column: "fit_type"
    type: "ENUM('宽松','修身','直筒','A字','oversize','紧身','其他')"
    description: "版型"
    required: true
  - field: "fabric_composition"
    db_column: "fabric_composition"
    type: "VARCHAR(200)"
    description: "面料成分及占比"
    required: true
  - field: "fabric_weight_gsm"
    db_column: "fabric_weight_gsm"
    type: "SMALLINT"
    description: "面料克重(g/m2)"
    required: false
  - field: "fabric_function"
    db_column: "fabric_function"
    type: "VARCHAR(200)"
    description: "功能面料特性(防晒/凉感/抗菌/免烫等)"
    required: false
  - field: "size_range"
    db_column: "size_range"
    type: "VARCHAR(30)"
    description: "尺码覆盖"
    required: true
  - field: "size_count"
    db_column: "size_count"
    type: "TINYINT"
    description: "尺码数量"
    required: true
    validation: "首波≤4"
  - field: "color_count"
    db_column: "color_count"
    type: "TINYINT"
    description: "颜色数量"
    required: true
    validation: "首波≤3"
  - field: "season_tag"
    db_column: "season_tag"
    type: "ENUM('春夏','夏季','秋冬','冬季','四季')"
    description: "季节属性"
    required: true
  - field: "return_rate_benchmark"
    db_column: "return_rate_est_pct"
    type: "DECIMAL(5,2)"
    description: "预估退货率(%)"
    required: true
  - field: "color_fastness_wash"
    db_column: "color_fast_wash"
    type: "TINYINT"
    description: "耐水洗色牢度"
    required: true
    validation: ">=4"

p5_unique_fields:
  - field: "a_grade_rate"
    db_column: "a_grade_rate_pct"
    type: "DECIMAL(5,2)"
    description: "A等品率"
    required: true
    validation: ">=95"
  - field: "color_deviation_std"
    db_column: "color_deviation_std"
    type: "VARCHAR(50)"
    description: "色差容差标准"
    required: true
  - field: "rapid_order_days"
    db_column: "rapid_order_days"
    type: "TINYINT"
    description: "急单响应天数"
    required: true
    validation: "<=7"
  - field: "defect_rate_max"
    db_column: "defect_rate_max_pct"
    type: "DECIMAL(4,2)"
    description: "次品率上限(%)"
    required: true
    validation: "<=5"
```

### B1 阈值表

| 指标 | 值 | 说明 |
|------|-----|------|
| 目标毛利率 | ≥35% | 退货率高需要毛利缓冲 |
| 保本ROI | ≤2.9 | |
| 首波SKU上限 | ≤3色×≤4码=≤12 | 铁律！ |
| 新品营销费比 | 25-30% | |
| 稳定营销费比 | 10-15% | |
| 目标退款率 | ≤25% | 行业正常值 |
| 安全库存(热门码) | 30天 | |
| 安全库存(冷门码) | 15天 | |
| 季节提前量 | T-10周投放/T-6周备货 | |
| 首批MOQ | 150-300/色 | |
| 回本周期 | 2-3月 | |
| 过季折损 | 季末7折/跨季5折 | |

---

## B2: 鞋帽

### B2-P0: 品类定位

```
你是鞋帽品类专家。

## 核心特征
- 尺码精密度要求极高（鞋类半码差异直接影响退货率）
- 退货率最高可达28%（鞋类试穿后退货比例大）
- 鞋模成本高（首单需摊销）
- 帽子季节性强，防晒帽/毛线帽/Bucket Hat交替
- 鞋类：舒适度>外观，试穿体验无法线上传递是最大痛点
```

### B2-P1: 市场分析

```
你是鞋帽品类数据分析师。请对 {品类名称} 进行市场大盘分析。

## A. 大盘概况
12个月趋势+阶段判断

## B. 尺码精度分析（鞋帽核心！）
- 鞋类：半码(如37.5/38.5)覆盖率和消费者需求
- 帽子：头围调节范围(cm)和可调节方式
- 尺码退货原因TOP5

## C. 品类细分
- 鞋：运动/休闲/凉鞋/靴子/拖鞋/学步鞋
- 帽：鸭舌帽/渔夫帽/毛线帽/棒球帽/防晒帽
- 各类的份额和增长趋势

## D. 季节波动模型
- 凉鞋(4-8月峰值)/靴子(10-2月峰值)
- 防晒帽(4-9月)/毛线帽(10-3月)

## E. 关键词+输出
```

### B2-P2: 机会点挖掘

```
## A. 尺码空白
- 半码鞋(37.5/38.5/39.5)的市场供给vs搜索需求
- 大码(43+)/小码(34-)机会

## B. 功能空白
- 鞋：减震/防滑/防水/透气/轻量/矫正
- 帽：UPF/速干/折叠/防风/可调节

## C. 评论痛点
- 🔴鞋：磨脚(最大！)/尺码不准/不透气/开胶/鞋底滑
- 🔴帽：头围不合适/变形/不透气/掉色
- 🟡穿搭：不会搭配

## D. 输出：《鞋帽机会评分卡》
```

### B2-P3: 聚焦分析

```
## A. BSR追踪 Top30 × 4周

## B. 规格透视（≥6维）
- 品类×材质×尺码覆盖×功能×价格带×季节
- 鞋类专属：鞋底材质(EVA/橡胶/PU)/鞋面材质/闭合方式(系带/魔术贴/套脚)
- 帽类专属：帽型/帽檐宽度/UPF值/可调节范围/可折叠

## C. 竞品对标 5-8款
特别关注：尺码表的详细程度+退货率+试穿体验传达方式

## D. 卖点清单 ≥15条
```

### B2-P4: 产品定位

```
## A. SKU规划
- 鞋类：首波≤2型×≤5码=≤10SKU（鞋模成本高）
- 帽类：首波≤3色×≤2尺寸=≤6SKU
- 半码策略：是否提供半码？(增加SKU但降低退货)

## B. 成本核算
- 鞋：鞋楦/鞋面/鞋底/鞋垫/辅料+加工+模具摊销+检测+包装
- 帽：面料/帽檐/调节扣+加工+包装
- 鞋类退货双倍成本（试穿后不可二次销售）

## C. 定价
目标毛利率≥35%
退货双倍成本需计入定价模型

## D. 尺码指南（核心！）
- 鞋：内长(cm)对照表+量脚方法视频+偏大偏小提示
- 帽：头围测量方法+可调节说明
```

### B2-P5: 供应链

```
## A. 供应商寻源

## B. 鞋帽专项验收
- 鞋：鞋楦精度/鞋底耐磨/耐折测试/剥离强度/防滑系数
- 帽：尺寸精度/色牢度/UPF实测/变形测试

## C. 合同
- 鞋模精度公差标准
- 次品率≤5%

## D. MOQ：鞋150-300/帽200-400
```

### B2-P6: 执行落地

```
## A. Listing
- 标题：品牌+品类+材质+功能+场景+尺码
- 首屏：尺码指南(强化！)+试穿视频+材质细节+360度展示
- 鞋类必备：内长尺寸表+量脚方法视频+偏大偏小说明
- A+：设计→材质→尺码指南(重点)→场景→搭配→洗护

## B. 广告
- 季节铁律同服装
- 尺码精准人群+场景标签

## C. 库存+节点+周复盘
```

### B2 字段定义（DB-ready）

```yaml
subcategory: "鞋帽"
subcategory_code: "B2"

unique_fields:
  - field: "product_type"
    db_column: "product_type"
    type: "ENUM('运动鞋','休闲鞋','凉鞋','靴子','拖鞋','学步鞋','鸭舌帽','渔夫帽','毛线帽','棒球帽','防晒帽','其他')"
    description: "鞋帽子类型"
    required: true
  - field: "half_size_available"
    db_column: "half_size_YN"
    type: "TINYINT(1)"
    description: "是否有半码"
    required: false
  - field: "size_range"
    db_column: "size_range"
    type: "VARCHAR(50)"
    description: "尺码范围"
    required: true
  - field: "inner_length_cm"
    db_column: "inner_length_cm"
    type: "VARCHAR(100)"
    description: "内长(cm)各码对应表(JSON)"
    required: true
  - field: "sole_material"
    db_column: "sole_material"
    type: "ENUM('EVA','橡胶','PU','TPR','其他')"
    description: "鞋底材质"
    required: false
  - field: "upper_material"
    db_column: "upper_material"
    type: "VARCHAR(100)"
    description: "鞋面/帽面材质"
    required: true
  - field: "closure_type"
    db_column: "closure_type"
    type: "ENUM('系带','魔术贴','套脚','拉链','弹力','可调节','其他')"
    description: "闭合/调节方式"
    required: true
  - field: "upf_value"
    db_column: "upf_value"
    type: "SMALLINT"
    description: "UPF值(帽类)"
    required: false
  - field: "head_circumference_range"
    db_column: "head_circ_cm"
    type: "VARCHAR(20)"
    description: "头围范围(cm)(帽类)"
    required: false
  - field: "return_rate_double_cost"
    db_column: "return_double_cost_YN"
    type: "TINYINT(1)"
    description: "退货是否涉及双倍成本"
    required: true
  - field: "shoe_mold_cost_cny"
    db_column: "shoe_mold_cost_cny"
    type: "DECIMAL(10,2)"
    description: "鞋模成本(元)"
    required: false
```

### B2 阈值表

| 指标 | 值 | 说明 |
|------|-----|------|
| 目标毛利率 | ≥35% | 退货双倍成本 |
| 保本ROI | ≤2.9 | |
| 目标退款率 | ≤28% | 鞋类正常范围 |
| 首波SKU上限(鞋) | ≤2型×≤5码=10 | |
| 首波SKU上限(帽) | ≤3色×≤2尺寸=6 | |
| 安全库存 | 35天 | |
| 首批MOQ(鞋) | 150-300 | |
| 首批MOQ(帽) | 200-400 | |
| 回本周期 | 2-3月 | |
| 鞋模成本摊销 | 首单摊销 | |

---

## B3: 内衣

### B3-P0: 品类定位

```
你是内衣品类专家。

## 核心特征
- Cup精度是第一生命线（Cup不准=100%退货）
- 内衣属于"不可退"或"条件退"品类，品控必须前置
- 面料贴肤舒适度>外观
- 套装定价策略(A+B组合)是利润核心
- 尺码复杂度最高（底围+Cup交叉SKU多）
```

### B3-P1: 市场分析

```
## A. 大盘+趋势
- 12个月趋势、阶段判断
- 无钢圈/运动内衣/哺乳内衣等细分趋势

## B. Cup×底围矩阵（内衣核心维度）
- 按Cup(A/B/C/D/E+) × 底围(70/75/80/85/90+) 的销量矩阵
- 找出"需求大但供给少"的Cup-底围组合
- 大Cup(D+)/小底围(70-)通常是蓝海

## C. 面料舒适度趋势
- 莫代尔/纯棉/冰丝/蕾丝/无痕 占比变化
- 抗菌/透气/吸湿排汗功能面料

## D. 关键词+输出
```

### B3-P2: 机会点挖掘

```
## A. Cup空白分析
- 各Cup段的供需比
- 大Cup(D/E/F)市场长期供给不足 → 蓝海！
- 小Cup(A/B)竞争激烈但容量大

## B. 功能空白
- 运动支撑(高/中/低强度)
- 哺乳功能(前开扣/下拉式)
- 无痕(无钢圈+无缝)
- 聚拢/调整型

## C. 面料触感空白
- 追求"无感穿着"体验的产品增速

## D. 评论痛点
- 🔴Cup不准(偏大/偏小/空杯/压杯) → 头号痛点
- 🔴钢圈不适(顶/勒/戳)
- 🔴肩带滑落/太紧
- 🟡面料(不透气/起球/变形)
- 🟢搭配(内裤不配套/颜色差)

## E. 输出：《内衣机会评分卡》
```

### B3-P3: 聚焦分析

```
## A. BSR追踪 Top30 × 4周

## B. 规格透视（≥6维）
- Cup × 底围 × 功能(日常/运动/哺乳/美背) × 面料 × 价格带
- 设计(无钢圈/软钢圈/前扣/后扣/套头) × 销量
- 套装(文胸+内裤) vs 单品 的客单价/复购率差异

## C. 竞品对标 3-5款
卡片特别关注：
- Cup尺码精准度表述
- 不可退/条件退政策
- 面料舒适度传达方式

## D. 卖点清单 ≥15条
```

### B3-P4: 产品定位

```
## A. SKU规划
- Cup×底围交叉=理论SKU数巨大，需要精准取舍
- 首波策略：选最主流的3个Cup×3个底围=9个SKU
- 套装定价：A+B打包价比单买低10-15%

## B. 成本核算
面料+钢圈/模杯+肩带+背扣+蕾丝+加工+检测+包装
Cup越多杯模成本越高

## C. 定价
目标毛利率≥38%（高退货+不可退=需要毛利缓冲）
套装定价差：A+B vs A+B打包

## D. 不可退品控策略
- 独立包装+防拆封贴
- 试穿指南视频
- 尺码推荐算法（基于自报数据推荐Cup）
```

### B3-P5: 供应链

```
## A. 供应商寻源

## B. 内衣专项验收
- Cup精度：每个Cup号必须有独立模具
- 钢圈：弹性/防锈/末端包裹
- 肩带：弹性疲劳测试(1000次拉伸)
- 背扣：拉力测试
- 面料：pH值/甲醛/色牢度

## C. 合同
- Cup精度公差标准
- 独立杯模要求
- 次品率≤3%

## D. MOQ：200-400/Cup
```

### B3-P6: 执行落地

```
## A. Listing
- 标题：品牌+功能+Cup+面料+设计+场景
- 首屏：Cup尺码指南(核心！)+真人试穿+面料细节+不可退说明
- A+：设计→Cup选择指南→面料→功能→搭配(套装)→洗护

## B. 广告
- DMP女性+Cup+消费力标签
- 尺码精准匹配广告

## C. 库存+周复盘
安全库存：30天
重点关注：Cup退货率分析（哪个Cup退货最高？）
```

### B3 字段定义

```yaml
subcategory: "内衣"
subcategory_code: "B3"

unique_fields:
  - field: "cup_size"
    db_column: "cup_size"
    type: "ENUM('A','B','C','D','E','F','G+')"
    description: "Cup尺码"
    required: true
  - field: "band_size"
    db_column: "band_size"
    type: "ENUM('70','75','80','85','90','95+')"
    description: "底围尺码"
    required: true
  - field: "function_type"
    db_column: "function_type"
    type: "ENUM('日常','运动','哺乳','美背','聚拢','无痕','调整型','睡眠','其他')"
    description: "功能类型"
    required: true
  - field: "underwire_type"
    db_column: "underwire_type"
    type: "ENUM('无钢圈','软钢圈','钢圈','其他')"
    description: "钢圈类型"
    required: true
  - field: "support_level"
    db_column: "support_level"
    type: "ENUM('低','中','高')"
    description: "支撑强度"
    required: false
  - field: "non_returnable"
    db_column: "non_returnable_YN"
    type: "TINYINT(1)"
    description: "是否不可退"
    required: true
  - field: "set_discount_pct"
    db_column: "set_discount_pct"
    type: "DECIMAL(5,2)"
    description: "套装折扣率(%)"
    required: false
  - field: "mold_per_cup"
    db_column: "mold_per_cup_YN"
    type: "TINYINT(1)"
    description: "每个Cup独立模具"
    required: true
  - field: "shoulder_strap_fatigue"
    db_column: "strap_fatigue_cycles"
    type: "SMALLINT"
    description: "肩带疲劳测试(次)"
    required: true
    validation: ">=1000"
```

### B3 阈值表

| 指标 | 值 | 说明 |
|------|-----|------|
| 目标毛利率 | ≥38% | 高退货+不可退缓冲 |
| 保本ROI | ≤2.6 | |
| 目标退款率 | ≤15% | |
| 首波SKU上限 | 3Cup×3底围=9 | |
| 安全库存 | 30天 | |
| 首批MOQ | 200-400/Cup | |
| 回本周期 | 3-4月 | |
| 套装折扣 | 10-15% | vs单买 |
| 次品率上限 | ≤3% | |

---

## B4: 家居服

### B4-P0: 品类定位

```
你是家居服品类专家。

## 核心特征
- 季节驱动明显（冬季厚款/夏季薄款销售额差3-5倍）
- 面料舒适度=一切（贴身穿，触感第一）
- 退货率中高(18-22%)，尺码和面料是主因
- 套装为主(睡衣+睡裤)，客单价高于单件
- 与内衣有交叉(睡裙/吊带)
```

### B4-P1: 市场分析

```
## A. 大盘+趋势
- 12个月趋势、季节拆分
- "居家经济"趋势影响

## B. 季节×面料矩阵
- 夏季(6-8月)：莫代尔/冰丝/纯棉薄款
- 冬季(11-2月)：珊瑚绒/法兰绒/针织棉
- 各季节的主力面料和价格带

## C. 品类细分
- 睡衣套装/睡裙/家居服/浴袍/家居鞋
- 男女/情侣/亲子

## D. 关键词+输出
```

### B4-P2: 机会点挖掘

```
## A. 面料升级空白
- 从普通纯棉→莫代尔→冰丝→天然丝 的升级路径
- 功能性：抗菌/凉感/自发热

## B. 场景空白
- 居家办公/月子服/病号服/情侣套装

## C. 冬季空白（核心机会）
- 冬季家居服市场远大于夏季
- 珊瑚绒/法兰绒品类的品质升级空间

## D. 评论痛点
- 🔴面料(起球/缩水/不透气/掉毛)
- 🔴尺码(偏大偏小)
- 🟡掉色(深色款重灾区)
- 🟢设计(不够好看/太土)

## E. 输出
```

### B4-P3: 聚焦分析

```
## A. BSR追踪 Top30 × 4周

## B. 规格透视（≥6维）
- 季节 × 面料 × 款式(套装/睡裙/浴袍) × 价格带 × 颜色
- 功能性 × 客单价（抗菌/凉感功能溢价多少）
- 男女/情侣/亲子的销量分布

## C. 竞品对标 3-5款
## D. 卖点清单 ≥15条
```

### B4-P4: 产品定位

```
## A. SKU规划
- 夏季线+冬季线分开
- 套装为主(客单价高)，辅以单件引流
- 情侣套装溢价20-30%

## B. 成本核算
面料+加工+包装+检测+运输
跨季库存折损预留

## C. 定价
目标毛利率≥35%
冬季款溢价15-20%

## D. 卖点提炼
面料触感+设计颜值+场景适配
```

### B4-P5: 供应链

```
## A. 供应商寻源
## B. 专项验收：同服装(面料锁定/色牢度/尺寸公差)
## C. MOQ：150-300/色
```

### B4-P6: 执行落地

```
## A. Listing：面料触感传达(视频+大图)+场景展示
## B. 广告：季节铁律+冬季集中投放
## C. 库存：冬季备货系数1.5
## D. 换季清仓策略
```

### B4 字段定义

```yaml
subcategory: "家居服"
subcategory_code: "B4"

unique_fields:
  - field: "style_type"
    db_column: "style_type"
    type: "ENUM('睡衣套装','睡裙','浴袍','家居服','家居鞋','情侣套装','亲子套装','其他')"
    description: "家居服类型"
    required: true
  - field: "fabric_season"
    db_column: "fabric_season"
    type: "ENUM('夏季薄款','春秋中厚','冬季加厚')"
    description: "面料季节厚度"
    required: true
  - field: "fabric_function"
    db_column: "fabric_function"
    type: "VARCHAR(100)"
    description: "功能面料(抗菌/凉感/自发热)"
    required: false
  - field: "couple_set_premium"
    db_column: "couple_premium_pct"
    type: "DECIMAL(5,2)"
    description: "情侣套装溢价率(%)"
    required: false
  - field: "winter_premium"
    db_column: "winter_premium_pct"
    type: "DECIMAL(5,2)"
    description: "冬季款溢价率(%)"
    required: false
  - field: "cross_season_loss"
    db_column: "cross_season_loss_pct"
    type: "DECIMAL(5,2)"
    description: "跨季库存折损率(%)"
    required: true
```

### B4 阈值表

| 指标 | 值 |
|------|-----|
| 目标毛利率 | ≥35% |
| 目标退款率 | ≤22% |
| 安全库存 | 35天 |
| 冬季备货系数 | 1.5 |
| 首批MOQ | 150-300/色 |
| 冬季溢价 | 15-20% |
| 情侣套装溢价 | 20-30% |
| 跨季折损 | 季末7折/跨季5折 |

---

## B5: 配饰

### B5-P0: 品类定位

```
你是配饰品类专家。

## 核心特征
- 潮流驱动！生命周期极短（快则1-3月）
- 高毛利率(≥40%)，低退货率(≤18%)
- SKU多但单SKU量少，考验快反能力
- 冲动消费+种草转化是核心路径
- 材质(合金/银/钛钢/珍珠/亚克力)决定定价天花板
```

### B5-P1: 市场分析

```
## A. 大盘+趋势
- 潮流周期扫描（当前热：珍珠/Y2K/极简/多巴胺？）
- 小红书/抖音热搜配饰Top20

## B. 材质格局
- 合金(占比最高，价格低)/银饰/钛钢/珍珠/亚克力/布艺
- 各材质的均价和溢价率

## C. 品类细分
- 耳饰/项链/手链/戒指/发饰/胸针/丝巾/帽子/围巾/包包
- 各类流行周期

## D. 关键词+输出
```

### B5-P2: 机会点挖掘

```
## A. 潮流趋势空白
- 当前流行趋势 vs 市场供给时间差
- 快速测款可行性

## B. 材质升级空白
- 合金→钛钢→银→K金 的升级路径
- 新材质(珍珠母贝/亚克力/滴胶/编织)潜力

## C. 风格空白
- 极简/复古/甜美/暗黑/新中式/Y2K 各种风格的饱和度

## D. 评论痛点
- 🔴材质(过敏/掉色/变黑/褪色)
- 🔴做工(掉钻/断裂/不对称)
- 🟡实物不符(太小/太大/质感差)
- 🟢搭配(不知道怎么配)

## E. 输出
```

### B5-P3: 聚焦分析

```
## A. BSR追踪 Top30 × 4周（注意潮流动向变化）

## B. 规格透视
- 材质 × 风格 × 品类 × 价格带 × 颜色
- 潮流指数(小红书提及量/抖音播放量) × 销量

## C. 竞品对标 5-8款
特别注意：上新速度(多久上一波新款)/视觉风格/KOL合作

## D. 卖点清单 ≥15条
```

### B5-P4: 产品定位

```
## A. SKU策略
- "多款式少数量"，每款50-100件测款
- 爆款追加(7天内翻单)
- 不以"打透"为目标，以"快"为目标

## B. 成本核算
材质+电镀/工艺+配件+包装+检测(镍释放/过敏原)
高毛利率对冲快时尚库存风险

## C. 定价
目标毛利率≥40%
潮流溢价窗口期：上架前2周可溢价30-50%

## D. 快反策略
- 测款周期≤2周
- 爆款翻单≤7天
- 滞销款第3周启动促销
```

### B5-P5: 供应链

```
## A. 供应商寻源
- 核心要求：快！小单快反能力
- 电镀厂/合金厂/手工坊三类供应商

## B. 专项验收
- 镍释放量(欧盟REACH标准)
- 电镀层厚度/耐磨测试
- 过敏原检测
- 做工：对称性/牢固度/光泽度

## C. 合同
- 快反条款：追加订单≤7天交货
- 小单接受：50件起订

## D. MOQ：50-200（小单快反）
```

### B5-P6: 执行落地

```
## A. Listing
- 标题：品牌+材质+风格+品类+佩戴场景
- 首屏：佩戴效果图(真人！)+细节放大+搭配推荐
- 视频带货能力>图文

## B. 广告
- 小红书/抖音种草为第一优先级
- 冲动消费→低客单价→高转化
- 快节奏：测款7天→判断→翻单或淘汰

## C. 库存
安全库存：25天（最低，因为快时尚）
滞销预警：上架14天加购率<3%→启动促销

## D. 周复盘
重点关注：新品动销率/潮流热度变化/材质投诉
```

### B5 字段定义

```yaml
subcategory: "配饰"
subcategory_code: "B5"

unique_fields:
  - field: "accessory_type"
    db_column: "accessory_type"
    type: "ENUM('耳饰','项链','手链','戒指','发饰','胸针','丝巾','帽子','围巾','包包','其他')"
    description: "配饰类型"
    required: true
  - field: "material_main"
    db_column: "material_main"
    type: "ENUM('合金','银925','钛钢','铜','珍珠','亚克力','布艺','真皮','K金','其他')"
    description: "主材质"
    required: true
  - field: "plating_type"
    db_column: "plating_type"
    type: "ENUM('镀金','镀银','镀铑','镀白金','无电镀','其他')"
    description: "电镀类型"
    required: false
  - field: "trend_index"
    db_column: "trend_index"
    type: "INT"
    description: "潮流热度指数(小红书+抖音提及量)"
    required: false
  - field: "nickel_release"
    db_column: "nickel_release_YN"
    type: "TINYINT(1)"
    description: "镍释放检测"
    required: true
  - field: "quick_response_days"
    db_column: "quick_response_days"
    type: "TINYINT"
    description: "快反翻单天数"
    required: true
    validation: "<=7"
  - field: "moq_min"
    db_column: "moq_min"
    type: "SMALLINT"
    description: "最小起订量"
    required: true
    validation: "50-200"
  - field: "trend_lifecycle_days"
    db_column: "trend_lifecycle_days"
    type: "SMALLINT"
    description: "潮流生命周期预估(天)"
    required: false
  - field: "stagnant_warning_days"
    db_column: "stagnant_warning_days"
    type: "TINYINT"
    description: "滞销预警天数"
    required: true
    validation: "14"
```

### B5 阈值表

| 指标 | 值 | 说明 |
|------|-----|------|
| 目标毛利率 | ≥40% | 高毛利对冲快时尚风险 |
| 保本ROI | ≤2.5 | |
| 目标退款率 | ≤18% | |
| 安全库存 | 25天 | |
| 首批MOQ | 50-200 | |
| 快反翻单 | ≤7天 | |
| 测款周期 | ≤14天 | |
| 滞销预警 | 上架14天 | |
| 潮流溢价窗口 | 上架前2周+30-50% | |
| 回本周期 | 1-2月 | |

---

# 第三部分：🧊 塑料品类

---

## C1: 收纳

### C1-P0: 品类定位

```
你是收纳品类专家。请对 {品类名称} 进行品类定位分析。

## 核心特征
- 功能导向+空间效率驱动
- 低客单价(9.9-79元)，价格敏感度高
- 公模产品泛滥，同质化是最大敌人
- 品质感靠视觉设计+材质手感+细节做工体现
- 套组/组合销售提升客单价

## 输出
- 品类机会评分（1-10）：___
- 公模vs私模决策建议
- 推荐切入角度
```

### C1-P1: 市场分析

```
## A. 大盘概况（情报通BI/生参）
- 12个月趋势、"收纳经济"趋势判断
- 品类阶段判断

## B. 尺寸×容量分层
- 小(桌面)/中(衣柜)/大(床底)各容量段价格带和销量
- 容量段机会标记

## C. 材质格局
- PP(主流)/PET(透明感)/PE(软质)/ABS(高硬度)/布料
- 各材质的均价和消费者偏好

## D. 功能细分
- 衣物/厨房/桌面/化妆品/旅行/食品收纳
- 各功能的市场份额

## E. 关键词+输出：3条结论+1条同质化预警
```

### C1-P2: 机会点挖掘

```
## A. 套组空白分析
- 单品→套组的升级路径和溢价率
- 套组搜索趋势

## B. 折叠/空间优化空白
- 可折叠vs固定式的供需比
- 空间利用率=核心卖点

## C. 设计美学空白
- "塑料盒"→"家居装饰品"的设计升级空间
- 颜色/外观差异化评估

## D. 评论痛点
- 🔴尺寸(偏大偏小/与描述不符)
- 🔴质量(塑料薄/易裂/毛刺/盖子不严)
- 🟡味道(新塑料味)
- 🟢设计(不好看/颜色low/叠不起来)

## E. 输出：《收纳机会评分卡》
```

### C1-P3: 聚焦分析

```
## A. BSR追踪 Top30 × 4周

## B. 规格透视（≥6维）
- 容量×材质×场景×价格带×颜色×可折叠
- 套组vs单件的客单价和转化率
- 外观设计评分(1-10) × 销量

## C. 竞品对标 5-10款
特别关注：差异化设计点/材质升级/包装/视觉呈现

## D. 卖点清单 ≥15条
```

### C1-P4: 产品定位

```
## A. SKU策略
- 公模测款→私模起量路径
- 套组：3件套/5件套提高客单价
- 颜色：白色/透明+1个流行色

## B. 成本核算
- 公模：原料(PP)+注塑+包装+运输
- 私模：+模具费摊销(首批分摊)
- 套组包装成本

## C. 定价
目标毛利率≥20%
套组：套组价格 < ∑单品×0.85

## D. 品质感低成本提升
- 磨砂表面+圆角+厚壁感+统一色系+好包装
```

### C1-P5: 供应链

```
## A. 供应商寻源 ≥3家

## B. 专项验收
- 尺寸公差：±1mm
- 壁厚均匀无气泡
- 表面无毛刺/缩水/流痕
- 堆叠测试：满载5层
- 跌落测试：1m不碎裂
- 异味测试：开箱30min无异味

## C. 合同
- 模具所有权归属(私模自己拥有)
- 原料指定(PP牌号锁定)
- 首件签样

## D. MOQ：500-1000
```

### C1-P6: 执行落地

```
## A. Listing
- 标题：品牌+尺寸+容量+场景+材质+特点
- 首屏：尺寸参照图+使用场景+堆叠演示
- 五点：精确尺寸+材质安全+场景+堆叠+性价比
- A+：痛点→方案→尺寸→场景→材质→对比

## B. 广告：性价比传达+组合销售(捆绑/满减)
## C. 库存：40天，无明显季节
```

### C1 字段定义

```yaml
subcategory: "收纳"
subcategory_code: "C1"
parent_category: "塑料"

unique_fields:
  - field: "dimensions_mm"
    db_column: "dimensions_mm"
    type: "VARCHAR(50)"
    description: "长×宽×高(mm)"
    required: true
  - field: "capacity_liters"
    db_column: "capacity_liters"
    type: "DECIMAL(8,2)"
    description: "容量(L)"
    required: false
  - field: "material_main"
    db_column: "material_main"
    type: "ENUM('PP','PET','PE','ABS','PS','布料','其他')"
    description: "主材质"
    required: true
  - field: "foldable"
    db_column: "foldable_YN"
    type: "TINYINT(1)"
    description: "是否可折叠"
    required: false
  - field: "stackable"
    db_column: "stackable_YN"
    type: "TINYINT(1)"
    description: "是否可堆叠"
    required: false
  - field: "is_set"
    db_column: "is_set_YN"
    type: "TINYINT(1)"
    description: "是否套组"
    required: true
  - field: "set_piece_count"
    db_column: "set_piece_count"
    type: "TINYINT"
    description: "套组件数"
    required: false
  - field: "mold_type"
    db_column: "mold_type"
    type: "ENUM('公模','私模')"
    description: "模具类型"
    required: true
  - field: "mold_cost_cny"
    db_column: "mold_cost_cny"
    type: "DECIMAL(10,2)"
    description: "模具费用(元)"
    required: false
  - field: "wall_thickness_mm"
    db_column: "wall_thickness_mm"
    type: "DECIMAL(4,2)"
    description: "壁厚(mm)"
    required: false
  - field: "surface_finish"
    db_column: "surface_finish"
    type: "ENUM('光面','磨砂','纹理','透明','半透明')"
    description: "表面处理"
    required: false
  - field: "usage_scene"
    db_column: "usage_scene"
    type: "VARCHAR(200)"
    description: "使用场景"
    required: true
  - field: "drop_test_height_m"
    db_column: "drop_test_height_m"
    type: "DECIMAL(3,1)"
    description: "跌落测试高度(m)"
    required: true
    validation: ">=1.0"
```

### C1 阈值表

| 指标 | 值 |
|------|-----|
| 目标毛利率 | ≥20% |
| 保本ROI | ≤5.0 |
| 新品营销费比 | 20-30% |
| 稳定营销费比 | 10-15% |
| 目标退款率 | ≤5% |
| 安全库存 | 40天 |
| 首批MOQ | 500-1000 |
| 尺寸公差 | ±1mm |
| 跌落测试 | ≥1m |
| 回本周期 | 2-3月 |
| 套组折扣 | 85折vs单品总和 |

---

## C2: 日用

### C2-P0: 品类定位

```
你是日用品类专家。请对 {品类名称} 进行品类定位分析。

## 核心特征
- 几乎无行业分层，完全竞争市场
- 价格极度敏感（差1元影响转化率）
- 同质化严重，视觉差异化是唯一出路
- 品质感=低成本高感知（设计/颜色/包装）
- 组合销售是提升客单价核心手段
```

### C2-P1: 市场分析

```
## A. 大盘+趋势
## B. 品类细分：厨房/卫浴/清洁/家居/办公日用
## C. 材质格局：PP为主/PET增长/硅胶新兴
## D. 关键词+输出
```

### C2-P2: 机会点挖掘

```
## A. 设计升级空白
- "够用"→"好看"→"好用且好看"三级跳
- 日系极简/北欧风/ins风的溢价空间

## B. 材质升级路径
- PP→磨砂PP→食品级PP→硅胶

## C. 多功能合一空白
## D. 评论痛点
- 🔴品质(易坏/易裂/变形)
- 🔴设计(太丑/不好用)
- 🟡味道(塑料味)

## E. 输出
```

### C2-P3: 聚焦分析

```
## A. BSR追踪 Top30 × 4周
## B. 规格透视：功能×材质×设计风格×价格带×颜色
## C. 竞品 5-10款
## D. 卖点清单
```

### C2-P4: 产品定位

```
## A. SKU：主推1-2款+组合销售
## B. 成本+定价：毛利率≥20%，定价倍率1.5-2倍
## C. 品质感：统一色系+磨砂+圆角+好包装
```

### C2-P5: 供应链
```
同收纳（注塑类标准），MOQ：500-1000
```

### C2-P6: 执行落地
```
组合销售(买二送一/满减)+性价比传达
```

### C2 字段定义

```yaml
subcategory: "日用"
subcategory_code: "C2"
unique_fields:
  - field: "daily_use_type"
    db_column: "daily_use_type"
    type: "ENUM('厨房日用','卫浴日用','清洁日用','家居日用','办公日用','其他')"
    description: "日用子类型"
    required: true
  - field: "design_style"
    db_column: "design_style"
    type: "ENUM('日系极简','北欧','ins风','韩式','美式','无风格')"
    description: "设计风格"
    required: false
  - field: "multi_function"
    db_column: "multi_function_YN"
    type: "TINYINT(1)"
    description: "是否多功能合一"
    required: false
  - field: "price_multiple"
    db_column: "price_multiple"
    type: "DECIMAL(4,2)"
    description: "定价倍率"
    required: true
    validation: "1.5-2.0"
```

### C2 阈值表

| 指标 | 值 |
|------|-----|
| 目标毛利率 | ≥20% |
| 定价倍率 | 1.5-2.0 |
| 目标退款率 | ≤5% |
| 安全库存 | 40天 |
| MOQ | 500-1000 |

---

## C3: 厨房

### C3-P0: 品类定位

```
你是厨房品类专家。请对 {品类名称} 进行品类定位分析。

## 核心特征
- 食品接触级要求（GB 4806/FDA/LFGB）
- 耐温是关键（-20℃~120℃）
- 食品安全认证=入场券
- 材质决定定价：PP<Tritan<硅胶<玻璃<不锈钢
- 功能创新拉开差距

## 机会关键
- PP→Tritan/硅胶材质升级溢价50-100%
- 功能组合创新（砧板+沥水+收纳一体）
```

### C3-P1: 市场分析

```
## A. 大盘+趋势
## B. 食品等级分层
- 食品接触级vs非食品接触级的价格差
- 各认证(GB 4806/FDA/LFGB)持有率

## C. 材质格局
- PP/Tritan/硅胶/玻璃/不锈钢/陶瓷
- 各类均价和溢出价

## D. 关键词+输出
```

### C3-P2: 机会点挖掘

```
## A. 材质升级空白
- PP→Tritan成本增量vs溢价空间
- Tritan品类渗透率

## B. 功能组合创新
- 沥水+收纳/切菜+量杯/蒸煮+滤水

## C. 认证护城河
- GB 4806持有率低的品类→认证=壁垒

## D. 评论痛点
- 🔴安全(异味/变形/掉色/材质不明)
- 🔴耐用(高温变形/开裂/涂层脱落)
- 🟡设计(不好清洗/沥水差)

## E. 输出
```

### C3-P3: 聚焦分析

```
## A. BSR追踪 Top30 × 4周
## B. 规格透视：材质×耐温×认证×功能×价格带×设计
## C. 竞品对标 5-8款
## D. 卖点清单 ≥15条
```

### C3-P4: 产品定位

```
## A. SKU：食品接触级=底线，材质升级差异化
## B. 成本：原料(食品级溢价20-50%)+认证摊销
## C. 定价：毛利率≥22%，食品级溢价15-30%
## D. 认证费摊销：GB 4806检测费/批次→摊入单价
```

### C3-P5: 供应链

```
## A. 供应商：食品级注塑资质
## B. 验收：GB 4806全项目/耐温测试/迁移量测试
## C. 合同：食品级原料锁定+每批次检测报告
## D. MOQ：500-1000
```

### C3-P6: 执行落地

```
Listing首屏：检测报告+耐温测试视频+材质对比
广告：视频测评(高温/摔落测试)
```

### C3 字段定义

```yaml
subcategory: "厨房"
subcategory_code: "C3"
unique_fields:
  - field: "food_grade"
    db_column: "food_grade_YN"
    type: "TINYINT(1)"
    description: "是否食品接触级"
    required: true
  - field: "cert_gb4806"
    db_column: "cert_gb4806_YN"
    type: "TINYINT(1)"
    description: "GB 4806认证"
    required: true
  - field: "temp_max_celsius"
    db_column: "temp_max_c"
    type: "SMALLINT"
    description: "最高耐温(℃)"
    required: true
  - field: "temp_min_celsius"
    db_column: "temp_min_c"
    type: "SMALLINT"
    description: "最低耐温(℃)"
    required: true
  - field: "microwave_safe"
    db_column: "microwave_YN"
    type: "TINYINT(1)"
    description: "微波炉可用"
    required: false
  - field: "migration_test"
    db_column: "migration_test_YN"
    type: "TINYINT(1)"
    description: "迁移量测试"
    required: true
```

### C3 阈值表

| 指标 | 值 |
|------|-----|
| 目标毛利率 | ≥22% |
| 目标退款率 | ≤5% |
| MOQ | 500-1000 |
| 食品级溢价 | 15-30% |
| Tritan溢价 | 50-100% |

---

## C4: 文具

### C4-P0: 品类定位

```
你是文具品类专家。请对 {品类名称} 进行品类定位分析。

## 核心特征
- 强季节！开学季(2月/9月)占全年50%+
- 场景驱动(学习/办公/手帐/绘画/儿童)
- 设计/IP是核心溢价来源
- 年龄分层明显
- 开学季断货=全年最大损失！T-6周必须备货到位
```

### C4-P1: 市场分析

```
## A. 大盘+趋势
- 开学季峰值量化(2月+9月占全年%)
## B. 场景×年龄分层
- 儿童(3-6岁)/学生(7-18岁)/成人(18+)
## C. IP/设计趋势
- 联名IP(迪士尼/三丽鸥)/国潮/ins风
## D. 关键词+输出
```

### C4-P2: 机会点挖掘

```
## A. 场景空白：手帐经济/儿童STEAM文具
## B. 设计/IP空白：国潮文具渗透率
## C. 评论痛点：断墨/漏墨/设计/握感
## D. 输出
```

### C4-P3: 聚焦分析

```
## A. BSR Top30 × 4周
## B. 规格透视：年龄×场景×功能×IP×价格带×设计
## C. 竞品 5-8款
## D. 卖点清单
```

### C4-P4: 产品定位

```
## A. SKU：开学季前2月开发完成
## B. 成本+定价：毛利率≥25%，开学季溢价10-15%
```

### C4-P5: 供应链（注塑+印刷，MOQ 500-1500）
### C4-P6: 执行落地（T-6周备货+T-4周投放+2月/9月爆发）

### C4 字段定义

```yaml
subcategory: "文具"
subcategory_code: "C4"
unique_fields:
  - field: "age_target"
    db_column: "age_target"
    type: "ENUM('儿童(3-6)','学生(7-18)','成人')"
    description: "目标年龄群"
    required: true
  - field: "usage_scene"
    db_column: "usage_scene"
    type: "ENUM('学习','办公','手帐','绘画','儿童','其他')"
    description: "使用场景"
    required: true
  - field: "has_ip"
    db_column: "has_ip_YN"
    type: "TINYINT(1)"
    description: "是否有IP联名"
    required: false
  - field: "school_season_share_pct"
    db_column: "school_season_share_pct"
    type: "DECIMAL(5,2)"
    description: "开学季销售占比(%)"
    required: true
  - field: "school_season_prep_weeks"
    db_column: "prep_weeks"
    type: "TINYINT"
    description: "备货提前周数"
    required: true
    validation: ">=6"
```

### C4 阈值表

| 指标 | 值 |
|------|-----|
| 目标毛利率 | ≥25% |
| 目标退款率 | ≤8% |
| 安全库存 | 35天 |
| 开学季备货 | T-6周 |
| 开学季溢价 | 10-15% |
| MOQ | 500-1500 |

---

## C5: 园艺

### C5-P0: 品类定位

```
你是园艺品类专家。请对 {品类名称} 进行品类定位分析。

## 核心特征
- 季节性强（3-6月+9-10月两季高峰）
- UV抗老化是第一品控指标
- 户外使用→耐候性(日晒/雨淋/温差)
- 阳台场景增长强劲

## 机会关键
- 抗UV升级（普通PP→抗UV PP）
- 阳台园艺场景（小空间/壁挂/折叠）
```

### C5-P1: 市场分析

```
## A. 大盘+趋势(春秋高峰)、阳台经济
## B. 植物类型：绿植/多肉/花卉/蔬菜
## C. 品类细分：花盆/花架/浇水工具/园艺工具
## D. 关键词+输出
```

### C5-P2: 机会点挖掘

```
## A. 材质升级：抗UV PP/可降解/陶土
## B. 阳台场景：小空间/壁挂/自动浇水
## C. 评论痛点
- 🔴老化(晒变色/变脆/开裂)
- 🔴漏水/排水不畅
- 🟡尺寸不对/不稳
```

### C5-P3: 聚焦分析

```
## A. BSR Top30 × 4周
## B. 规格透视：植物×材质×抗UV×尺寸×户外/室内
## C. 竞品 5-8款
## D. 卖点清单
```

### C5-P4: 产品定位

```
## A. SKU：抗UV材质=核心卖点
## B. 成本：抗UV粒子溢价
## C. 定价：毛利率≥22%，UV属性溢价10-20%
```

### C5-P5: 供应链

```
专项验收：
- UV老化测试(QUV 500h)
- 耐候性(户外暴露)
- 抗冲击/排水设计
MOQ：500-1000
```

### C5-P6: 执行落地

```
季节集中投放(3-6月+9-10月)+阳台场景化内容
```

### C5 字段定义

```yaml
subcategory: "园艺"
subcategory_code: "C5"
unique_fields:
  - field: "plant_type"
    db_column: "plant_type"
    type: "ENUM('绿植','多肉','花卉','蔬菜','香草','盆景','通用')"
    description: "适用植物类型"
    required: true
  - field: "uv_resistant"
    db_column: "uv_resistant_YN"
    type: "TINYINT(1)"
    description: "是否抗UV"
    required: true
  - field: "uv_test_hours"
    db_column: "uv_test_hours"
    type: "SMALLINT"
    description: "UV老化测试(h)"
    required: false
    validation: ">=500"
  - field: "outdoor_suitable"
    db_column: "outdoor_YN"
    type: "TINYINT(1)"
    description: "户外适用"
    required: true
  - field: "balcony_friendly"
    db_column: "balcony_friendly_YN"
    type: "TINYINT(1)"
    description: "阳台友好"
    required: false
  - field: "drainage_design"
    db_column: "drainage_YN"
    type: "TINYINT(1)"
    description: "排水设计"
    required: false
  - field: "season_peak_months"
    db_column: "peak_months"
    type: "VARCHAR(30)"
    description: "高峰月份"
    required: true
```

### C5 阈值表

| 指标 | 值 |
|------|-----|
| 目标毛利率 | ≥22% |
| 目标退款率 | ≤6% |
| 安全库存 | 40天 |
| 季节高峰 | 3-6月+9-10月 |
| MOQ | 500-1000 |
| UV溢价 | 10-20% |
| UV测试 | ≥500h |

| UV测试 | ≥500h |

---

# 第四部分：📦 中大件品类

---

## D1: 家具

### D1-P0: 品类定位

```
你是家具品类专家。请对 {品类名称} 进行品类定位分析。

## 核心特征
- 物流成本占比高（可占售价15-30%）
- 体积重是定价核心变量
- 安装难度=转化率杀手
- 客单价高(199-999元+)，决策周期长
- 售后问题复杂（运输损坏/安装/维修）

## 核心铁律
- P1阶段优先算物流成本，不通过就换品！
- 包装优化=利润优化（每减1kg=省5-15元）
- 安装视频+配件齐全=降低退货50%
- 包装件数≤2件
```

### D1-P1: 市场分析

```
## A. 大盘概况
12个月趋势、住宅/家居趋势影响、品类阶段判断

## B. 物流成本敏感性分析（家具必做！）
1. 按运输方式拆分：快递/物流/干线+支线/安装配送
2. 各渠道成本占比和优化空间
3. 体积重优化方案（平板包装/拆装设计）
4. 输出《物流成本测算表》

## C. 品类细分
桌椅/柜架/床/沙发/儿童家具/办公家具/户外家具

## D. 组装方式分布
整装(到货即用) / KD拆装 / RTA需组装 的溢价和退货率

## E. 关键词分析+输出：3条结论+1条物流风险预警
```

### D1-P2: 机会点挖掘

```
## A. 组装优化空白
- "傻瓜式安装"(无工具/卡扣式)的市场需求
- 整装vs拆装的市场份额变化

## B. 空间适配空白
- 小户型/租房友好(折叠/多功能/小尺寸)
- "一物多用"产品搜索趋势

## C. 服务差异化空白
- 质保延长(3年→5年→10年)
- 上门安装服务覆盖率
- 免费退换货保险

## D. 评论痛点
- 🔴运输损坏(磕碰/断裂/缺件)
- 🔴安装困难(说明书不清/缺工具/孔位不对)
- 🔴实物不符(尺寸/颜色/质感)
- 🟡质量(摇晃/异响/掉漆)
- 🟢售后(客服不理/退货运费高)

## E. 输出：《家具机会评分卡》
```

### D1-P3: 聚焦分析

```
## A. BSR追踪 Top30 × 4周

## B. 规格透视（≥6维）
- 品类×尺寸段×材质(实木/板材/金属)×价格带
- 组装方式×安装难度×退货率
- 包装方式(平板/半组装/整装)×物流成本
- 质保年限×销量

## C. 竞品对标 3-5款（每款成本高，深挖）
卡片特别关注：包装设计/安装说明/售后政策/物流方案

## D. 卖点清单 ≥15条
```

### D1-P4: 产品定位

```
## A. SKU策略
- 1-2个规格打透，不要多
- 包装件数最小化(1箱最优，2箱极限)
- 平板包装优先

## B. 成本核算
材料+加工+包装(ISTA6测试)+国内运+头程+尾程+安装(如有)
物流成本=按实际体积重测算

## C. 定价
目标毛利率≥28%
体积重公式：长×宽×高/6000
物流占比建议≤25%

## D. 体积重优化
- 可拆装设计减包装体积
- 平板包装降体积重

## E. 价值感塑造
- 材质细节+10年质保+安装视频+AR摆放预览
```

### D1-P5: 供应链

```
## A. 供应商寻源 ≥3家

## B. 专项验收
- ISTA 6包装测试（跌落/堆码/振动/冲击）
- 结构强度（负载120%额定承重）
- 材质：实木含水率/板材甲醛/金属防锈
- 配件齐全度（100%点数）
- 安装说明书可读性

## C. 合同
- CKD/SKD评估
- 运输损坏供应商承担
- 配件补发≤48h

## D. MOQ：50-100
```

### D1-P6: 执行落地

```
## A. Listing（三大必做！）
- 尺寸参照图(真人/日常物品对比)
- 安装视频(中英文+图示)
- FAQ前置(能进电梯?一人能装?有味道?)

## B. 广告：高CPC抓转化+再营销+视频必备

## C. 库存：安全60天，补货提前60天

## D. 节点：家居节/双11/618集中爆发

## E. 售后体系
- 安装视频+配件补发当天发出+退换货物流方案
```

### D1 字段定义

```yaml
subcategory: "家具"
subcategory_code: "D1"
unique_fields:
  - field: "furniture_type"
    db_column: "furniture_type"
    type: "ENUM('桌椅','柜架','床','沙发','儿童家具','办公家具','户外家具','其他')"
    required: true
  - field: "assembly_type"
    db_column: "assembly_type"
    type: "ENUM('整装','KD拆装','RTA需组装')"
    required: true
  - field: "package_count"
    db_column: "package_count"
    type: "TINYINT"
    required: true
    validation: "≤2"
  - field: "package_dimensions_mm"
    db_column: "pkg_dimensions_mm"
    type: "VARCHAR(50)"
    description: "包装尺寸(mm)"
    required: true
  - field: "gross_weight_kg"
    db_column: "gross_weight_kg"
    type: "DECIMAL(8,2)"
    required: true
  - field: "volumetric_weight_kg"
    db_column: "vol_weight_kg"
    type: "DECIMAL(8,2)"
    required: true
  - field: "logistics_cost_pct"
    db_column: "logistics_cost_pct"
    type: "DECIMAL(5,2)"
    required: true
    validation: "≤25"
  - field: "ista_test"
    db_column: "ista_test_YN"
    type: "TINYINT(1)"
    required: true
  - field: "warranty_years"
    db_column: "warranty_years"
    type: "TINYINT"
    required: true
  - field: "install_video_url"
    db_column: "install_video_url"
    type: "VARCHAR(500)"
    required: true
  - field: "elevator_friendly"
    db_column: "elevator_friendly_YN"
    type: "TINYINT(1)"
    required: true
  - field: "spare_parts_response_hours"
    db_column: "spare_parts_resp_hrs"
    type: "TINYINT"
    required: true
    validation: "≤48"
```

### D1 阈值表

| 指标 | 值 | 说明 |
|------|-----|------|
| 目标毛利率 | ≥28% | |
| 保本ROI | ≤3.6 | |
| 目标退款率 | ≤8% | |
| 安全库存 | 60天 | |
| 物流占比 | ≤25% | 铁律 |
| 包装件数 | ≤2件 | 铁律 |
| MOQ | 50-100 | |
| 回本周期 | 4-6月 | |
| 配件补发 | ≤48h | |

---

## D2: 健身

### D2-P0: 品类定位

```
你是健身器材品类专家。请对 {品类名称} 进行品类定位分析。

## 核心特征
- 安全认证（承重/稳定性/防滑）
- 噪音控制（家用场景核心，≤60dB）
- 折叠/收纳（小空间友好）
- 重量大→物流成本占比高
- 达人/KOL测评转化效果远超图文
```

### D2-P1: 市场分析

```
## A. 大盘+趋势：家庭健身趋势
## B. 品类细分：有氧/力量/瑜伽/康复/智能健身
## C. 功能×噪音分层：静音溢价评估
## D. 折叠/收纳趋势
## E. 关键词+输出
```

### D2-P2: 机会点挖掘

```
## A. 折叠+静音空白（溢价20-30%）
## B. 智能健身空白（APP/课程/数据追踪）
## C. 小空间适配
## D. 评论痛点
- 🔴噪音(扰民)、🔴不稳(安全隐患)
- 🔴占地(太大)、🟡耐用(掉漆/松动)
## E. 输出
```

### D2-P3: 聚焦分析

```
BSR Top30 + 规格透视(品类×折叠×噪音×承重×价格带×智能)
+ 竞品3-5款 + 卖点清单
```

### D2-P4: 产品定位

```
SKU：1款主打+配件
成本：材料+安全认证+ISTA包装+测评预算预留
定价：毛利率≥30%
```

### D2-P5: 供应链

```
验收：承重150%额定/稳定性/噪音≤60dB/安全认证(CE/UL)
MOQ：50-100
```

### D2-P6: 执行落地

```
Listing：达人测评视频+折叠演示+噪音对比+安全认证
库存：55天，达人测评是核心手段
```

### D2 字段定义

```yaml
subcategory: "健身"
subcategory_code: "D2"
unique_fields:
  - field: "fitness_type"
    db_column: "fitness_type"
    type: "ENUM('有氧','力量','瑜伽','康复','智能','配件','其他')"
    required: true
  - field: "foldable"
    db_column: "foldable_YN"
    type: "TINYINT(1)"
    required: true
  - field: "noise_level_db"
    db_column: "noise_level_db"
    type: "TINYINT"
    validation: "≤60"
  - field: "max_load_kg"
    db_column: "max_load_kg"
    type: "DECIMAL(8,2)"
    required: true
  - field: "smart_features"
    db_column: "smart_features"
    type: "VARCHAR(200)"
```

### D2 阈值表

| 指标 | 值 |
|------|-----|
| 目标毛利率 | ≥30% |
| 噪音标准 | ≤60dB |
| 安全库存 | 55天 |
| MOQ | 50-100 |

---

## D3: 户外

### D3-P0: 品类定位

```
你是户外品类专家。请对 {品类名称} 进行品类定位分析。

## 核心特征
- 季节性强（5-9月高峰）
- 防水/UV/轻量 三大核心指标
- 场景驱动(露营/徒步/野餐/沙滩)
- 便携性(折叠/收纳体积)是关键
- 材质(面料/涂层/支架)决定定价

## 机会关键
- 防水等级差异化(IPX4→IPX6→IPX8)
- 超轻量化(Dyneema/钛合金)
- 场景化套餐(帐篷+睡袋+防潮垫)
```

### D3-P1: 市场分析

```
## A. 大盘+趋势：露营经济/精致露营
## B. 场景×人数分层：单人/双人/家庭 × 露营/徒步/野餐
## C. 防水等级分布：防泼水→PU1000→PU3000→专业防水
## D. 材质格局+关键词+输出
```

### D3-P2: 机会点挖掘

```
## A. 防水等级空白(PU3000+)
## B. 轻量空白(超轻产品搜索趋势)
## C. 场景套餐空白
## D. 评论痛点
- 🔴防水(漏水/渗水)、🔴质量(断裂/撕裂)
- 🟡重量(太重)、🟢搭建(难搭)
## E. 输出
```

### D3-P3/P4/P5/P6

```
P3: BSR+透视(场景×人数×防水×重量×价格带×材质)+竞品3-5款+卖点
P4: SKU 1-2场景+成本(面料+支架+涂层+防水测试)+定价毛利率≥30%,防水每级溢价10-15%
P5: 验收(防水静水压+面料撕裂+支架承重+UV+拉链5000次),MOQ 50-100
P6: Listing场景化视频+防水实测+重量展示,季节集中5-10月,库存50天
```

### D3 字段定义

```yaml
subcategory: "户外"
subcategory_code: "D3"
unique_fields:
  - field: "outdoor_type"
    db_column: "outdoor_type"
    type: "ENUM('帐篷','天幕','睡袋','防潮垫','户外桌椅','炊具','灯具','背包','其他')"
    required: true
  - field: "waterproof_rating"
    db_column: "waterproof_rating"
    type: "VARCHAR(20)"
    description: "防水等级(PU2000/IPX6)"
    required: true
  - field: "weight_grams"
    db_column: "weight_grams"
    type: "INT"
    required: true
  - field: "packed_volume_liters"
    db_column: "packed_volume_l"
    type: "DECIMAL(6,2)"
  - field: "person_capacity"
    db_column: "person_capacity"
    type: "TINYINT"
  - field: "wind_resistance"
    db_column: "wind_resistance"
    type: "VARCHAR(20)"
```

### D3 阈值表

| 指标 | 值 |
|------|-----|
| 目标毛利率 | ≥30% |
| 目标退款率 | ≤10% |
| 安全库存 | 50天 |
| 季节高峰 | 5-10月 |
| MOQ | 50-100 |
| 防水溢价/级 | 10-15% |

---

## D4: 家电

### D4-P0: 品类定位

```
你是小家电品类专家。请对 {品类名称} 进行品类定位分析。

## 核心特征
- 3C认证必须！无证=不能卖
- 能耗等级影响转化率
- 噪音控制(≤55dB为优)
- 售后成本摊销（故障率3-8%）
- 智能(AIoT/APP)是溢价核心
- 安全(防触电/防火/过热保护)

## 机会关键
- 智能升级(普通→智能→AIoT)
- 节能升级(3级→1级能效)
- 颜值升级(传统→设计师款)
```

### D4-P1: 市场分析

```
## A. 大盘+趋势：智能家居
## B. 能效等级分布：1级/2级/3级市场份额和支付意愿
## C. 智能功能渗透率：APP控制/语音/场景联动溢价率
## D. 品类×功率分层+关键词+输出
```

### D4-P2: 机会点挖掘

```
## A. 智能空白(哪些品类还没"智能化"?)
## B. 节能空白(高能耗品类升级机会)
## C. 设计空白(外观升级)
## D. 评论痛点
- 🔴安全(漏电/过热/冒烟)、🔴噪音(太吵)
- 🔴耐用(几个月就坏)、🟢售后(维修困难)
## E. 输出
```

### D4-P3/P4/P5/P6

```
P3: BSR+透视(品类×功率×能效×噪音×智能×价格带)+竞品3-5款+卖点清单
P4: SKU 1款主打+配件/耗材,成本(BOM+模具+3C认证+检测+售后预留3-5%),定价毛利率≥28%
P5: 验收(3C原件+电气安全+EMC+噪音≤55dB+耐久1000h+过热保护),故障率≤3%,MOQ 50-200
P6: Listing首屏(3C+参数+场景+噪音实测)+高CPC抓转化+售后体系(7天无理由+1年换新+3年保修+配件商城)
```

### D4 字段定义

```yaml
subcategory: "家电"
subcategory_code: "D4"
unique_fields:
  - field: "appliance_type"
    db_column: "appliance_type"
    type: "ENUM('厨房小电','清洁电器','个护电器','环境电器','智能家居','其他')"
    required: true
  - field: "power_watts"
    db_column: "power_watts"
    type: "SMALLINT"
    required: true
  - field: "energy_rating"
    db_column: "energy_rating"
    type: "ENUM('1级','2级','3级','无')"
    required: true
  - field: "noise_db"
    db_column: "noise_db"
    type: "TINYINT"
    required: true
    validation: "≤55为优"
  - field: "cert_3c"
    db_column: "cert_3c_YN"
    type: "TINYINT(1)"
    required: true
  - field: "smart_features"
    db_column: "smart_features"
    type: "VARCHAR(300)"
  - field: "expected_failure_rate_pct"
    db_column: "failure_rate_pct"
    type: "DECIMAL(4,2)"
    required: true
    validation: "≤3"
  - field: "after_sales_cost_per_unit"
    db_column: "aftersales_cost_cny"
    type: "DECIMAL(10,2)"
    required: true
  - field: "spare_parts_years"
    db_column: "spare_parts_years"
    type: "TINYINT"
    required: true
    validation: "≥3"
```

### D4 阈值表

| 指标 | 值 | 说明 |
|------|-----|------|
| 目标毛利率 | ≥28% | |
| 噪音标准 | ≤55dB | |
| 预计故障率 | ≤3% | 合同约束 |
| 售后预留 | 售价3-5% | |
| 安全库存 | 55天 | |
| 配件供应 | ≥3年 | |
| MOQ | 50-200 | |
| 回本周期 | 4-6月 | |

---

# 附录

## 附录 A: 数据库建表 SQL（MariaDB）

### A.1 子类目基础信息表

```sql
CREATE TABLE IF NOT EXISTS subcategory_meta (
    id                INT AUTO_INCREMENT PRIMARY KEY,
    subcategory_code  VARCHAR(4) NOT NULL UNIQUE COMMENT '子类目代码 A1-D4',
    subcategory_name  VARCHAR(20) NOT NULL COMMENT '子类目名称',
    parent_code       VARCHAR(2) NOT NULL COMMENT '大类代码',
    parent_name       VARCHAR(10) NOT NULL COMMENT '大类名称',
    gross_margin_min  DECIMAL(5,2) COMMENT '最低目标毛利率(%)',
    breakeven_roi_max DECIMAL(5,2) COMMENT '最高保本ROI',
    default_moq       INT COMMENT '默认MOQ',
    safe_stock_days   SMALLINT COMMENT '安全库存天数',
    return_rate_max   DECIMAL(5,2) COMMENT '目标退款率上限(%)',
    payback_months    VARCHAR(10) COMMENT '回本周期',
    new_mkt_fee_pct   VARCHAR(20) COMMENT '新品营销费比范围',
    stable_mkt_fee_pct VARCHAR(20) COMMENT '稳定营销费比范围',
    created_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_parent (parent_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='19子类目基础阈值表';

-- 预填19条子类目数据
INSERT INTO subcategory_meta (subcategory_code, subcategory_name, parent_code, parent_name, gross_margin_min, breakeven_roi_max, default_moq, safe_stock_days, return_rate_max, payback_months) VALUES
('A1','孕产','A','母婴',32,3.1,400,50,8,'3-5月'),
('A2','婴童','A','母婴',30,3.3,400,45,10,'3-4月'),
('A3','童装','A','母婴',35,2.9,200,35,20,'2-3月'),
('A4','玩具','A','母婴',30,3.3,400,40,12,'3-4月'),
('A5','喂辅','A','母婴',28,3.6,1000,40,8,'3-5月'),
('B1','服装','B','服饰',35,2.9,200,30,25,'2-3月'),
('B2','鞋帽','B','服饰',35,2.9,200,35,28,'2-3月'),
('B3','内衣','B','服饰',38,2.6,300,30,15,'3-4月'),
('B4','家居服','B','服饰',35,2.9,200,35,22,'2-3月'),
('B5','配饰','B','服饰',40,2.5,100,25,18,'1-2月'),
('C1','收纳','C','塑料',20,5.0,750,40,5,'2-3月'),
('C2','日用','C','塑料',20,5.0,750,40,5,'2-3月'),
('C3','厨房','C','塑料',22,4.5,750,40,5,'2-3月'),
('C4','文具','C','塑料',25,4.0,1000,35,8,'2-3月'),
('C5','园艺','C','塑料',22,4.5,750,40,6,'2-3月'),
('D1','家具','D','中大件',28,3.6,75,60,8,'4-6月'),
('D2','健身','D','中大件',30,3.3,75,55,10,'4-6月'),
('D3','户外','D','中大件',30,3.3,75,50,10,'4-6月'),
('D4','家电','D','中大件',28,3.6,125,55,8,'4-6月');
```

### A.2 通用商品字段表

```sql
CREATE TABLE IF NOT EXISTS product_common_fields (
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id      VARCHAR(50) NOT NULL COMMENT '商品ID',
    subcategory_code VARCHAR(4) NOT NULL,
    platform        ENUM('tmall','taobao','jd','pdd','douyin','1688','amazon') NOT NULL,
    product_name    VARCHAR(500),
    brand           VARCHAR(100),
    shop_name       VARCHAR(200),
    front_price     DECIMAL(10,2),
    actual_price    DECIMAL(10,2),
    coupon_amount   DECIMAL(10,2),
    monthly_sales   INT,
    monthly_revenue DECIMAL(12,2),
    review_count    INT,
    review_score    DECIMAL(3,2),
    main_image_url  VARCHAR(500),
    detail_url      VARCHAR(500),
    collected_at    DATETIME,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_product (product_id),
    INDEX idx_subcategory (subcategory_code),
    INDEX idx_platform (platform)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通用商品字段表';
```

### A.3 子类目专属字段扩展表（EAV模式）

```sql
CREATE TABLE IF NOT EXISTS product_specialty_fields (
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id      VARCHAR(50) NOT NULL COMMENT '关联商品ID',
    subcategory_code VARCHAR(4) NOT NULL,
    field_name      VARCHAR(50) NOT NULL COMMENT '字段名(db_column)',
    field_value     TEXT COMMENT '字段值',
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_product_field (product_id, field_name),
    INDEX idx_subcategory_field (subcategory_code, field_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='子类目专属字段(EAV扩展)';
```

### A.4 市场分析记录表

```sql
CREATE TABLE IF NOT EXISTS market_analysis_records (
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    subcategory_code VARCHAR(4) NOT NULL,
    analysis_phase  ENUM('P0','P1','P2','P3','P4','P5','P6') NOT NULL,
    analysis_date   DATE NOT NULL,
    data_source     VARCHAR(100),
    key_findings    TEXT COMMENT '关键发现(JSON)',
    top_keywords    TEXT COMMENT '关键词(JSON)',
    price_bands     TEXT COMMENT '价格带(JSON)',
    brand_cr5_cr10  TEXT COMMENT '品牌CR5/CR10(JSON)',
    pain_points     TEXT COMMENT '痛点TOP20(JSON)',
    opportunity_score TEXT COMMENT '机会评分(JSON)',
    raw_data_ref    VARCHAR(500),
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_analysis (subcategory_code, analysis_phase, analysis_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='市场分析记录表';
```

## 附录 B: 字段总表

### B.1 19子类目独有字段统计

| 代码 | 子类目 | 独有字段数 | 核心字段关键词 |
|------|--------|-----------|---------------|
| A1 | 孕产 | 22 | 孕期阶段/认证/送礼/材质/安全测试 |
| A2 | 婴童 | 18 | 月龄段/安全等级/场景/pH值/甲醛 |
| A3 | 童装 | 17 | 风格/季节/尺码/面料/色牢度 |
| A4 | 玩具 | 14 | 教育层级/IP/3C认证/音量/玩法 |
| A5 | 喂辅 | 18 | 月龄/SC证/营养成分/微生物/重金属 |
| B1 | 服装 | 16 | 风格/版型/面料/尺码/色牢度 |
| B2 | 鞋帽 | 18 | 品类/半码/鞋底/闭合方式/UPF/头围 |
| B3 | 内衣 | 15 | Cup/底围/功能/钢圈/不可退/套装 |
| B4 | 家居服 | 12 | 类型/面料季节/功能/情侣/冬季溢价 |
| B5 | 配饰 | 14 | 类型/材质/电镀/潮流/镍释放/快反 |
| C1 | 收纳 | 18 | 尺寸/容量/材质/折叠/模具/壁厚/场景 |
| C2 | 日用 | 6 | 类型/设计风格/多功能/定价倍率 |
| C3 | 厨房 | 11 | 食品级/GB4806/耐温/微波炉/迁移量 |
| C4 | 文具 | 8 | 年龄/场景/IP/开学季/备货周数 |
| C5 | 园艺 | 12 | 植物类型/UV/户外/排水/季节高峰 |
| D1 | 家具 | 19 | 类型/组装/包装/体积重/承重/ISTA/电梯 |
| D2 | 健身 | 10 | 类型/折叠/噪音/承重/智能/测评 |
| D3 | 户外 | 11 | 类型/场景/人数/防水/重量/抗风 |
| D4 | 家电 | 13 | 类型/功率/能效/噪音/3C/故障率/售后 |
| **合计** | | **272** | |

## 附录 C: tmall-scraper API 对接

### C.1 子类目字段采集映射

```javascript
// 在 tmall-collector Skill 或 scraper-core.js 中使用
const CATEGORY_EXTRA_PARAMS = {
  'A1': { fields: 'pregnancy_stage,cert_a_class,gift_suitable,material_type' },
  'A2': { fields: 'age_range_month,safety_cert_level,scene_tag,ph_value' },
  'A3': { fields: 'style_tag,season_tag,size_range,fabric_composition' },
  'A4': { fields: 'education_level,ip_type,cert_3c,play_mode' },
  'A5': { fields: 'sc_license_no,organic,sugar_added,allergen_list' },
  'B1': { fields: 'style_tag,fit_type,fabric_composition,size_range' },
  'B2': { fields: 'product_type,half_size,inner_length_cm,sole_material' },
  'B3': { fields: 'cup_size,band_size,function_type,underwire_type' },
  'B4': { fields: 'style_type,fabric_season,fabric_function,couple_set' },
  'B5': { fields: 'accessory_type,material_main,plating_type,trend_index' },
  'C1': { fields: 'dimensions_mm,material_main,foldable,stackable,is_set' },
  'C2': { fields: 'daily_use_type,design_style,price_multiple' },
  'C3': { fields: 'food_grade,cert_gb4806,temp_max,migration_test' },
  'C4': { fields: 'age_target,usage_scene,has_ip,school_season' },
  'C5': { fields: 'plant_type,uv_resistant,outdoor,drainage' },
  'D1': { fields: 'furniture_type,assembly_type,gross_weight,vol_weight,ista_test' },
  'D2': { fields: 'fitness_type,foldable,noise_level,max_load,smart_features' },
  'D3': { fields: 'outdoor_type,waterproof_rating,weight_grams,wind_resistance' },
  'D4': { fields: 'appliance_type,power_watts,energy_rating,noise_db,cert_3c' },
};
```

### C.2 数据写入示例

```javascript
// 采集后将专属字段写入 EAV 表
async function saveSpecialtyFields(productId, subcategoryCode, rawData) {
  const fields = require(`./field-maps/${subcategoryCode}.json`).unique_fields;
  for (const f of fields) {
    const value = rawData[f.field];
    if (value !== undefined && value !== null) {
      await db.query(
        'INSERT INTO product_specialty_fields (product_id, subcategory_code, field_name, field_value) VALUES (?,?,?,?) ON DUPLICATE KEY UPDATE field_value=?',
        [productId, subcategoryCode, f.db_column, String(value), String(value)]
      );
    }
  }
}
```

## 附录 D: 核心公式（全品类通用）

```
【定价四级模型】
到手价     = 前台价 × 折扣系数 - 优惠券
扣点       = 到手价 × 平台费率 (淘系5.5%/跨境8-15%)
毛利额     = 到手价 × (1-退款率) - 扣点 - 快递 - 成本 - 到手价 × 营销费比
毛利率     = 毛利额 / 到手价
保本ROI    = 1 / 毛利率
定价倍率   = 售价 / 成本

【折扣系数】
日常=1.0 / A级=0.9 / A+级=0.88 / S级=0.85

【销售模型】
月销售额   = 年度目标 × 月大盘占比
月需访客   = 月销售额 / 客单价 / 转化率
库存成本   = (月销 × 备货系数 / 均价 / 30) × 备货可售天数

【大件物流】
体积重     = 长(cm) × 宽(cm) × 高(cm) / 6000
物流占比   = 物流成本 / 售价（大件≤25%）
```

---

_版本：v2.0 | 2026-07-02_
_覆盖：19子类目 × 7阶段(P0-P6) = 133段独立提示词 + 272个独有数据库字段_
_数据库：4张MariaDB建表SQL + 19条预填数据 + EAV扩展模式_
_API对接：tmall-scraper/万邦API 19子类目额外参数映射表_
_上游Skill：product-dev-workflow(v1.1) + ouyun-sgrade-market-analysis(v1.1)_
_原v1.0路径：C:/Users/Administrator/.workbuddy/skills/category-prompts/SKILL.md（已覆盖）_
