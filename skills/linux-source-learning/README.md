# Linux Source Learning Skill

一个面向 Codex 的 Linux 内核源码学习 Skill。它不是 Linux 知识问答库，而是一套源码学习工作流：帮助学习者建立系统地图、阅读真实源码、分析设计理由、用实验验证理解，并将结果沉淀为可复用的学习记录。

默认以 **Linux v6.1** 为源码基线。涉及后续版本时，Skill 会显式区分基线实现与版本演进，避免把不同版本的调用路径混在一起。

## 能做什么

- 为新的内核子系统建立分阶段学习计划
- 分析函数、结构体、宏、字段和执行路径
- 从运行时现象、性能问题或故障反推内核源码
- 分析机制存在的原因、设计选择、代码细节和工程权衡
- 按需使用 Git 历史寻找设计动机
- 设计 ftrace、trace-cmd、perf、tracepoint 或 eBPF 验证实验
- 通过解释、追踪、预测、调试和修改检查掌握程度
- 维护长期学习状态并生成 Markdown 学习笔记

## 工作方法

Skill 在适合的任务中采用以下学习链路：

```text
Context
  -> What
  -> How
  -> Why
  -> History
  -> Verify
  -> Check
  -> Output
```

它会先说明代码在内核中的位置及其责任边界，再进入数据结构、执行路径和关键实现。不会默认从逐行解释或粘贴大量源码开始。

## 项目结构

```text
linux-source-learning/
├── SKILL.md
├── README.md
├── agents/
│   └── openai.yaml
└── references/
    ├── git-archaeology.md
    ├── learning-method.md
    ├── learning-state.md
    ├── source-reading.md
    ├── topic-template.md
    ├── verification.md
    ├── version-policy.md
    └── why-analysis.md
```

- `SKILL.md`：Skill 入口、触发范围和学习模式路由。
- `agents/openai.yaml`：Codex UI 中显示的名称、简介和默认提示词。
- `references/`：仅在对应学习模式触发时加载的详细工作流。

## 安装

### 方法一：克隆到个人 Skills 目录

Linux、macOS 或 WSL：

```bash
mkdir -p ~/.codex/skills
git clone https://github.com/YOUR_NAME/linux-source-learning.git \
  ~/.codex/skills/linux-source-learning
```

Windows PowerShell：

```powershell
New-Item -ItemType Directory -Force "$HOME\.codex\skills" | Out-Null
git clone https://github.com/YOUR_NAME/linux-source-learning.git `
  "$HOME\.codex\skills\linux-source-learning"
```

将示例中的 `YOUR_NAME` 替换为实际的 GitHub 用户名或组织名。

### 方法二：复制已有目录

把整个 `linux-source-learning` 目录复制到：

```text
~/.codex/skills/linux-source-learning/
```

如果设置了 `CODEX_HOME`，则放到：

```text
$CODEX_HOME/skills/linux-source-learning/
```

目录中必须保留顶层 `SKILL.md`。安装后开启一个新对话即可测试发现情况。

## 基本用法

最稳定的方式是在请求中显式调用：

```text
使用 $linux-source-learning，帮我学习 Linux v6.1 的 VFS 子系统。
```

Codex 也可以根据 `SKILL.md` 中的名称和描述自动选择此 Skill，但显式调用更适合测试和可重复工作流。

## 使用场景

### 1. 学习新子系统

```text
使用 $linux-source-learning，以 Linux v6.1 为基线，
为我制定 VFS 子系统的学习计划。

请给出子系统边界、核心数据结构、主要执行路径、
源码阅读顺序、验证实验和掌握标准。
不要一开始逐行解释源码。
```

### 2. 分析函数或执行路径

```text
使用 $linux-source-learning，分析 Linux v6.1 中的
pick_next_task_fair()。

先说明源码位置、调用者、关键下游函数、相关数据结构、
状态变化和它在调度路径中的角色，再进入核心实现。
```

### 3. 分析设计理由

```text
使用 $linux-source-learning，解释为什么 CFS 使用 vruntime，
而不是直接按照实际运行时间排序。

请分别分析：
- Problem rationale
- Design rationale
- Code rationale
- Tradeoff rationale

区分已确认事实和推断。
```

### 4. 从问题反推源码

```text
使用 $linux-source-learning。

现象：线程被唤醒后偶尔很久才获得 CPU。
内核版本：Linux v6.1。

按照“现象 -> 假设 -> 证据 -> 调度路径 -> 源码 -> 验证”调查，
先给出能够区分不同假设的最小观测方案。
```

### 5. 设计验证实验

```text
使用 $linux-source-learning，设计一个验证 CFS vruntime 行为的实验。

环境为 Linux v6.1，可以使用 ftrace、trace-cmd 和 perf。
按照 Question、Prediction、Setup、Measurement、Expected Evidence、
Interpretation、Failure Analysis 输出，并优先使用最轻量的工具。
```

### 6. 检查掌握程度

```text
使用 $linux-source-learning，检查我是否真正理解了 CFS。

不要主要使用选择题。请通过 Explain、Trace、Predict、Debug、Modify
五类任务测试我，每次只出一道题，回答后再评估薄弱环节。
```

### 7. 生成学习笔记

```text
使用 $linux-source-learning，把本次 memblock_add_range() 学习过程
整理成可复用的 Markdown 笔记。

标明内核版本、已确认事实、推断、实验预期和实际实验结果，
并删除没有实际内容的章节。
```

## 长期学习状态

Skill 不会凭空拥有跨会话学习记忆。建议在自己的学习仓库中维护一个状态文件：

```text
使用 $linux-source-learning，为我创建 learning-state.yaml。

默认版本为 Linux v6.1，当前专题为 scheduler/CFS。
我已经掌握 task_struct 和 rq，正在学习 sched_entity、cfs_rq 和 vruntime。
```

继续学习时：

```text
使用 $linux-source-learning，读取 learning-state.yaml，
从当前薄弱环节继续，不要重新讲已经掌握的基础。
```

课程结束后可以要求更新状态。只有通过解释、追踪、预测、调试、修改或实验体现出来的内容，才适合标记为 `mastered`。

## 版本策略

- 默认基线：Linux v6.1。
- 用户指定其他版本时，以指定版本为准。
- 不把不同版本的函数和调用路径静默混合。
- 重要变化分成“v6.1 基线”“后续版本”“变化动机”和“学习影响”。
- 找不到可靠版本证据时，明确说明假设和不确定性。

例如研究后续调度器时，可以这样提问：

```text
使用 $linux-source-learning，比较 Linux v6.1 CFS 与后续 EEVDF。
分别说明两套实现，不要把后续版本的函数放进 v6.1 调用路径。
```

## 更新

如果通过 Git 克隆安装：

```bash
cd ~/.codex/skills/linux-source-learning
git pull --ff-only
```

更新后建议在新对话中重新测试 Skill。

## 校验

如果本机存在 Codex 自带的 `skill-creator`，可以使用其中的校验器：

```bash
python ~/.codex/skills/.system/skill-creator/scripts/quick_validate.py \
  ~/.codex/skills/linux-source-learning
```

校验器需要 Python 和 PyYAML。它主要检查 `SKILL.md` 的 frontmatter、名称、描述和未完成的占位内容。

## 设计原则

- Skill 保存“怎么学”，而不是复制整本 Linux 教材。
- 先建立坐标系，再阅读实现。
- 优先理解一条完整执行路径，而不是浏览大量不相干函数。
- 设计理由必须有证据，推断必须明确标注。
- Git 历史按需触发，不是每个符号都执行。
- 优先采用足够轻量的验证工具。
- 不伪造源码、调用关系、历史信息或实验结果。

## 完整学习工作区

对于长期学习，可以让 Skill 在你指定的目录中管理：

```text
linux-learning/
├── learning-state.yaml
├── topics/
├── experiments/
└── history/
```

Skill 会把源码 revision、专题笔记、实验记录、历史证据和下一步计划关联起来，但不会把个人学习数据写进 Skill 安装目录。

当分析依赖真实源码时，可以提供本地 Linux 仓库路径：

```text
使用 $linux-source-learning，基于 D:\workspace\linux 的实际源码分析 update_curr()。
先确认仓库 revision、版本和工作区状态，不要修改当前分支。
```

维护者可以使用 `references/evaluation-scenarios.md` 中的行为场景检查重大改动，避免版本混用、源码倾倒、无证据 Why 或把阅读误判为掌握。

## 适用边界

适用于 Linux 内核源码、子系统架构、运行机制、历史演进和验证实验的学习。

以下任务通常不需要调用本 Skill：

- 普通 Linux 命令用法
- 软件安装与系统管理
- Shell 脚本基础
- 与内核源码无关的一般应用程序开发

## 许可证

本项目当前未附带许可证。公开发布前，请根据预期的使用和贡献方式选择并添加合适的 `LICENSE` 文件。
