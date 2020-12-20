SET hive.default.fileformat=TEXTFILE;
SET hive.exec.reducers.bytes.per.reducer=256000;

-- [7 Best Hive Optimization Techniques \- Hive Performance \- DataFlair](https://data-flair.training/blogs/hive-optimization-techniques/)
-- 1. tez-execution engine
set hive.execution.engine=tez;
---- Tezへの割り当てメモリ
SET tez.am.resource.memory.mb=2560;
SET tez.task.resource.memory.mb=2560;
---- Tezコンテナへの割り当てメモリ(Tezの80%)
SET hive.tez.container.size=3840;
---- Javaへの割り当てメモリ(Tezコンテナの80%)
SET hive.tez.java.opts=-Xmx3072m;
-- 2. orcfile file format
set hive.exec.compress.intermediate=true;
set hive.exec.compress.output=true;
-- 3. partitioning
set hive.exec.dynamic.partition.mode=nonstrict;
-- 4. bucketing
set hive.enforce.bucketing=true;
set hive.enforce.sorting=true;
-- 5. vectorization
set hive.vectorized.execution.enabled=true;
set hive.vectorized.execution.reduce.enabled=true;
-- 6. cost-based optimization (cbo)
set hive.cbo.enable=true;
set hive.compute.query.using.stats=true;
set hive.stats.autogather=true;
set hive.stats.fetch.column.stats=true;
set hive.stats.fetch.partition.stats=true;

-- [LanguageManual JoinOptimization \- Apache Hive \- Apache Software Foundation](https://cwiki.apache.org/confluence/display/Hive/LanguageManual+JoinOptimization)
-- 1. map join
set hive.auto.convert.join=true;
set hive.auto.convert.join.noconditionaltask=true;
set hive.auto.convert.join.noconditionaltask.size=10000000;
-- 2. sort merge bucket join
set hive.auto.convert.sortmerge.join=true;
set hive.optimize.bucketmapjoin=true;
set hive.optimize.bucketmapjoin.sortedmerge=true;
set hive.auto.convert.sortmerge.join.bigtable.selection.policy=org.apache.hadoop.hive.ql.optimizer.TableSizeBasedBigTableSelectorForAutoSMJ;
-- 3. skew join
set hive.optimize.skewjoin=true;
set hive.skewjoin.key=100000;
set hive.skewjoin.mapjoin.map.tasks=100000;
set hive.skewjoin.mapjoin.min.split=33554432;
