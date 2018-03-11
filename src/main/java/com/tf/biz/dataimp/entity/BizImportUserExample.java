package com.tf.biz.dataimp.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BizImportUserExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public BizImportUserExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getOffset() {
        return offset;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andBatchNameIsNull() {
            addCriterion("batch_name is null");
            return (Criteria) this;
        }

        public Criteria andBatchNameIsNotNull() {
            addCriterion("batch_name is not null");
            return (Criteria) this;
        }

        public Criteria andBatchNameEqualTo(String value) {
            addCriterion("batch_name =", value, "batchName");
            return (Criteria) this;
        }

        public Criteria andBatchNameNotEqualTo(String value) {
            addCriterion("batch_name <>", value, "batchName");
            return (Criteria) this;
        }

        public Criteria andBatchNameGreaterThan(String value) {
            addCriterion("batch_name >", value, "batchName");
            return (Criteria) this;
        }

        public Criteria andBatchNameGreaterThanOrEqualTo(String value) {
            addCriterion("batch_name >=", value, "batchName");
            return (Criteria) this;
        }

        public Criteria andBatchNameLessThan(String value) {
            addCriterion("batch_name <", value, "batchName");
            return (Criteria) this;
        }

        public Criteria andBatchNameLessThanOrEqualTo(String value) {
            addCriterion("batch_name <=", value, "batchName");
            return (Criteria) this;
        }

        public Criteria andBatchNameLike(String value) {
            addCriterion("batch_name like", value, "batchName");
            return (Criteria) this;
        }

        public Criteria andBatchNameNotLike(String value) {
            addCriterion("batch_name not like", value, "batchName");
            return (Criteria) this;
        }

        public Criteria andBatchNameIn(List<String> values) {
            addCriterion("batch_name in", values, "batchName");
            return (Criteria) this;
        }

        public Criteria andBatchNameNotIn(List<String> values) {
            addCriterion("batch_name not in", values, "batchName");
            return (Criteria) this;
        }

        public Criteria andBatchNameBetween(String value1, String value2) {
            addCriterion("batch_name between", value1, value2, "batchName");
            return (Criteria) this;
        }

        public Criteria andBatchNameNotBetween(String value1, String value2) {
            addCriterion("batch_name not between", value1, value2, "batchName");
            return (Criteria) this;
        }

        public Criteria andBatchIdIsNull() {
            addCriterion("batch_id is null");
            return (Criteria) this;
        }

        public Criteria andBatchIdIsNotNull() {
            addCriterion("batch_id is not null");
            return (Criteria) this;
        }

        public Criteria andBatchIdEqualTo(Long value) {
            addCriterion("batch_id =", value, "batchId");
            return (Criteria) this;
        }

        public Criteria andBatchIdNotEqualTo(Long value) {
            addCriterion("batch_id <>", value, "batchId");
            return (Criteria) this;
        }

        public Criteria andBatchIdGreaterThan(Long value) {
            addCriterion("batch_id >", value, "batchId");
            return (Criteria) this;
        }

        public Criteria andBatchIdGreaterThanOrEqualTo(Long value) {
            addCriterion("batch_id >=", value, "batchId");
            return (Criteria) this;
        }

        public Criteria andBatchIdLessThan(Long value) {
            addCriterion("batch_id <", value, "batchId");
            return (Criteria) this;
        }

        public Criteria andBatchIdLessThanOrEqualTo(Long value) {
            addCriterion("batch_id <=", value, "batchId");
            return (Criteria) this;
        }

        public Criteria andBatchIdIn(List<Long> values) {
            addCriterion("batch_id in", values, "batchId");
            return (Criteria) this;
        }

        public Criteria andBatchIdNotIn(List<Long> values) {
            addCriterion("batch_id not in", values, "batchId");
            return (Criteria) this;
        }

        public Criteria andBatchIdBetween(Long value1, Long value2) {
            addCriterion("batch_id between", value1, value2, "batchId");
            return (Criteria) this;
        }

        public Criteria andBatchIdNotBetween(Long value1, Long value2) {
            addCriterion("batch_id not between", value1, value2, "batchId");
            return (Criteria) this;
        }

        public Criteria andUserNameIsNull() {
            addCriterion("user_name is null");
            return (Criteria) this;
        }

        public Criteria andUserNameIsNotNull() {
            addCriterion("user_name is not null");
            return (Criteria) this;
        }

        public Criteria andUserNameEqualTo(String value) {
            addCriterion("user_name =", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotEqualTo(String value) {
            addCriterion("user_name <>", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameGreaterThan(String value) {
            addCriterion("user_name >", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameGreaterThanOrEqualTo(String value) {
            addCriterion("user_name >=", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameLessThan(String value) {
            addCriterion("user_name <", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameLessThanOrEqualTo(String value) {
            addCriterion("user_name <=", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameLike(String value) {
            addCriterion("user_name like", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotLike(String value) {
            addCriterion("user_name not like", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameIn(List<String> values) {
            addCriterion("user_name in", values, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotIn(List<String> values) {
            addCriterion("user_name not in", values, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameBetween(String value1, String value2) {
            addCriterion("user_name between", value1, value2, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotBetween(String value1, String value2) {
            addCriterion("user_name not between", value1, value2, "userName");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(String value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(String value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(String value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(String value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(String value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(String value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLike(String value) {
            addCriterion("user_id like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotLike(String value) {
            addCriterion("user_id not like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<String> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<String> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(String value1, String value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(String value1, String value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeIsNull() {
            addCriterion("province_code is null");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeIsNotNull() {
            addCriterion("province_code is not null");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeEqualTo(Integer value) {
            addCriterion("province_code =", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeNotEqualTo(Integer value) {
            addCriterion("province_code <>", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeGreaterThan(Integer value) {
            addCriterion("province_code >", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeGreaterThanOrEqualTo(Integer value) {
            addCriterion("province_code >=", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeLessThan(Integer value) {
            addCriterion("province_code <", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeLessThanOrEqualTo(Integer value) {
            addCriterion("province_code <=", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeIn(List<Integer> values) {
            addCriterion("province_code in", values, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeNotIn(List<Integer> values) {
            addCriterion("province_code not in", values, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeBetween(Integer value1, Integer value2) {
            addCriterion("province_code between", value1, value2, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeNotBetween(Integer value1, Integer value2) {
            addCriterion("province_code not between", value1, value2, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceNameIsNull() {
            addCriterion("province_name is null");
            return (Criteria) this;
        }

        public Criteria andProvinceNameIsNotNull() {
            addCriterion("province_name is not null");
            return (Criteria) this;
        }

        public Criteria andProvinceNameEqualTo(String value) {
            addCriterion("province_name =", value, "provinceName");
            return (Criteria) this;
        }

        public Criteria andProvinceNameNotEqualTo(String value) {
            addCriterion("province_name <>", value, "provinceName");
            return (Criteria) this;
        }

        public Criteria andProvinceNameGreaterThan(String value) {
            addCriterion("province_name >", value, "provinceName");
            return (Criteria) this;
        }

        public Criteria andProvinceNameGreaterThanOrEqualTo(String value) {
            addCriterion("province_name >=", value, "provinceName");
            return (Criteria) this;
        }

        public Criteria andProvinceNameLessThan(String value) {
            addCriterion("province_name <", value, "provinceName");
            return (Criteria) this;
        }

        public Criteria andProvinceNameLessThanOrEqualTo(String value) {
            addCriterion("province_name <=", value, "provinceName");
            return (Criteria) this;
        }

        public Criteria andProvinceNameLike(String value) {
            addCriterion("province_name like", value, "provinceName");
            return (Criteria) this;
        }

        public Criteria andProvinceNameNotLike(String value) {
            addCriterion("province_name not like", value, "provinceName");
            return (Criteria) this;
        }

        public Criteria andProvinceNameIn(List<String> values) {
            addCriterion("province_name in", values, "provinceName");
            return (Criteria) this;
        }

        public Criteria andProvinceNameNotIn(List<String> values) {
            addCriterion("province_name not in", values, "provinceName");
            return (Criteria) this;
        }

        public Criteria andProvinceNameBetween(String value1, String value2) {
            addCriterion("province_name between", value1, value2, "provinceName");
            return (Criteria) this;
        }

        public Criteria andProvinceNameNotBetween(String value1, String value2) {
            addCriterion("province_name not between", value1, value2, "provinceName");
            return (Criteria) this;
        }

        public Criteria andCityCodeIsNull() {
            addCriterion("city_code is null");
            return (Criteria) this;
        }

        public Criteria andCityCodeIsNotNull() {
            addCriterion("city_code is not null");
            return (Criteria) this;
        }

        public Criteria andCityCodeEqualTo(Integer value) {
            addCriterion("city_code =", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeNotEqualTo(Integer value) {
            addCriterion("city_code <>", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeGreaterThan(Integer value) {
            addCriterion("city_code >", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeGreaterThanOrEqualTo(Integer value) {
            addCriterion("city_code >=", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeLessThan(Integer value) {
            addCriterion("city_code <", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeLessThanOrEqualTo(Integer value) {
            addCriterion("city_code <=", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeIn(List<Integer> values) {
            addCriterion("city_code in", values, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeNotIn(List<Integer> values) {
            addCriterion("city_code not in", values, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeBetween(Integer value1, Integer value2) {
            addCriterion("city_code between", value1, value2, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeNotBetween(Integer value1, Integer value2) {
            addCriterion("city_code not between", value1, value2, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityNameIsNull() {
            addCriterion("city_name is null");
            return (Criteria) this;
        }

        public Criteria andCityNameIsNotNull() {
            addCriterion("city_name is not null");
            return (Criteria) this;
        }

        public Criteria andCityNameEqualTo(String value) {
            addCriterion("city_name =", value, "cityName");
            return (Criteria) this;
        }

        public Criteria andCityNameNotEqualTo(String value) {
            addCriterion("city_name <>", value, "cityName");
            return (Criteria) this;
        }

        public Criteria andCityNameGreaterThan(String value) {
            addCriterion("city_name >", value, "cityName");
            return (Criteria) this;
        }

        public Criteria andCityNameGreaterThanOrEqualTo(String value) {
            addCriterion("city_name >=", value, "cityName");
            return (Criteria) this;
        }

        public Criteria andCityNameLessThan(String value) {
            addCriterion("city_name <", value, "cityName");
            return (Criteria) this;
        }

        public Criteria andCityNameLessThanOrEqualTo(String value) {
            addCriterion("city_name <=", value, "cityName");
            return (Criteria) this;
        }

        public Criteria andCityNameLike(String value) {
            addCriterion("city_name like", value, "cityName");
            return (Criteria) this;
        }

        public Criteria andCityNameNotLike(String value) {
            addCriterion("city_name not like", value, "cityName");
            return (Criteria) this;
        }

        public Criteria andCityNameIn(List<String> values) {
            addCriterion("city_name in", values, "cityName");
            return (Criteria) this;
        }

        public Criteria andCityNameNotIn(List<String> values) {
            addCriterion("city_name not in", values, "cityName");
            return (Criteria) this;
        }

        public Criteria andCityNameBetween(String value1, String value2) {
            addCriterion("city_name between", value1, value2, "cityName");
            return (Criteria) this;
        }

        public Criteria andCityNameNotBetween(String value1, String value2) {
            addCriterion("city_name not between", value1, value2, "cityName");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameIsNull() {
            addCriterion("threelevel_name is null");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameIsNotNull() {
            addCriterion("threelevel_name is not null");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameEqualTo(String value) {
            addCriterion("threelevel_name =", value, "threelevelName");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameNotEqualTo(String value) {
            addCriterion("threelevel_name <>", value, "threelevelName");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameGreaterThan(String value) {
            addCriterion("threelevel_name >", value, "threelevelName");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameGreaterThanOrEqualTo(String value) {
            addCriterion("threelevel_name >=", value, "threelevelName");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameLessThan(String value) {
            addCriterion("threelevel_name <", value, "threelevelName");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameLessThanOrEqualTo(String value) {
            addCriterion("threelevel_name <=", value, "threelevelName");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameLike(String value) {
            addCriterion("threelevel_name like", value, "threelevelName");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameNotLike(String value) {
            addCriterion("threelevel_name not like", value, "threelevelName");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameIn(List<String> values) {
            addCriterion("threelevel_name in", values, "threelevelName");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameNotIn(List<String> values) {
            addCriterion("threelevel_name not in", values, "threelevelName");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameBetween(String value1, String value2) {
            addCriterion("threelevel_name between", value1, value2, "threelevelName");
            return (Criteria) this;
        }

        public Criteria andThreelevelNameNotBetween(String value1, String value2) {
            addCriterion("threelevel_name not between", value1, value2, "threelevelName");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameIsNull() {
            addCriterion("four_levelname is null");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameIsNotNull() {
            addCriterion("four_levelname is not null");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameEqualTo(String value) {
            addCriterion("four_levelname =", value, "fourLevelname");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameNotEqualTo(String value) {
            addCriterion("four_levelname <>", value, "fourLevelname");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameGreaterThan(String value) {
            addCriterion("four_levelname >", value, "fourLevelname");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameGreaterThanOrEqualTo(String value) {
            addCriterion("four_levelname >=", value, "fourLevelname");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameLessThan(String value) {
            addCriterion("four_levelname <", value, "fourLevelname");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameLessThanOrEqualTo(String value) {
            addCriterion("four_levelname <=", value, "fourLevelname");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameLike(String value) {
            addCriterion("four_levelname like", value, "fourLevelname");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameNotLike(String value) {
            addCriterion("four_levelname not like", value, "fourLevelname");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameIn(List<String> values) {
            addCriterion("four_levelname in", values, "fourLevelname");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameNotIn(List<String> values) {
            addCriterion("four_levelname not in", values, "fourLevelname");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameBetween(String value1, String value2) {
            addCriterion("four_levelname between", value1, value2, "fourLevelname");
            return (Criteria) this;
        }

        public Criteria andFourLevelnameNotBetween(String value1, String value2) {
            addCriterion("four_levelname not between", value1, value2, "fourLevelname");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneIsNull() {
            addCriterion("five_levelphone is null");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneIsNotNull() {
            addCriterion("five_levelphone is not null");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneEqualTo(String value) {
            addCriterion("five_levelphone =", value, "fiveLevelphone");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneNotEqualTo(String value) {
            addCriterion("five_levelphone <>", value, "fiveLevelphone");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneGreaterThan(String value) {
            addCriterion("five_levelphone >", value, "fiveLevelphone");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneGreaterThanOrEqualTo(String value) {
            addCriterion("five_levelphone >=", value, "fiveLevelphone");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneLessThan(String value) {
            addCriterion("five_levelphone <", value, "fiveLevelphone");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneLessThanOrEqualTo(String value) {
            addCriterion("five_levelphone <=", value, "fiveLevelphone");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneLike(String value) {
            addCriterion("five_levelphone like", value, "fiveLevelphone");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneNotLike(String value) {
            addCriterion("five_levelphone not like", value, "fiveLevelphone");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneIn(List<String> values) {
            addCriterion("five_levelphone in", values, "fiveLevelphone");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneNotIn(List<String> values) {
            addCriterion("five_levelphone not in", values, "fiveLevelphone");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneBetween(String value1, String value2) {
            addCriterion("five_levelphone between", value1, value2, "fiveLevelphone");
            return (Criteria) this;
        }

        public Criteria andFiveLevelphoneNotBetween(String value1, String value2) {
            addCriterion("five_levelphone not between", value1, value2, "fiveLevelphone");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneIsNull() {
            addCriterion("second_phone is null");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneIsNotNull() {
            addCriterion("second_phone is not null");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneEqualTo(String value) {
            addCriterion("second_phone =", value, "secondPhone");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneNotEqualTo(String value) {
            addCriterion("second_phone <>", value, "secondPhone");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneGreaterThan(String value) {
            addCriterion("second_phone >", value, "secondPhone");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("second_phone >=", value, "secondPhone");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneLessThan(String value) {
            addCriterion("second_phone <", value, "secondPhone");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneLessThanOrEqualTo(String value) {
            addCriterion("second_phone <=", value, "secondPhone");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneLike(String value) {
            addCriterion("second_phone like", value, "secondPhone");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneNotLike(String value) {
            addCriterion("second_phone not like", value, "secondPhone");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneIn(List<String> values) {
            addCriterion("second_phone in", values, "secondPhone");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneNotIn(List<String> values) {
            addCriterion("second_phone not in", values, "secondPhone");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneBetween(String value1, String value2) {
            addCriterion("second_phone between", value1, value2, "secondPhone");
            return (Criteria) this;
        }

        public Criteria andSecondPhoneNotBetween(String value1, String value2) {
            addCriterion("second_phone not between", value1, value2, "secondPhone");
            return (Criteria) this;
        }

        public Criteria andDutyNameIsNull() {
            addCriterion("duty_name is null");
            return (Criteria) this;
        }

        public Criteria andDutyNameIsNotNull() {
            addCriterion("duty_name is not null");
            return (Criteria) this;
        }

        public Criteria andDutyNameEqualTo(String value) {
            addCriterion("duty_name =", value, "dutyName");
            return (Criteria) this;
        }

        public Criteria andDutyNameNotEqualTo(String value) {
            addCriterion("duty_name <>", value, "dutyName");
            return (Criteria) this;
        }

        public Criteria andDutyNameGreaterThan(String value) {
            addCriterion("duty_name >", value, "dutyName");
            return (Criteria) this;
        }

        public Criteria andDutyNameGreaterThanOrEqualTo(String value) {
            addCriterion("duty_name >=", value, "dutyName");
            return (Criteria) this;
        }

        public Criteria andDutyNameLessThan(String value) {
            addCriterion("duty_name <", value, "dutyName");
            return (Criteria) this;
        }

        public Criteria andDutyNameLessThanOrEqualTo(String value) {
            addCriterion("duty_name <=", value, "dutyName");
            return (Criteria) this;
        }

        public Criteria andDutyNameLike(String value) {
            addCriterion("duty_name like", value, "dutyName");
            return (Criteria) this;
        }

        public Criteria andDutyNameNotLike(String value) {
            addCriterion("duty_name not like", value, "dutyName");
            return (Criteria) this;
        }

        public Criteria andDutyNameIn(List<String> values) {
            addCriterion("duty_name in", values, "dutyName");
            return (Criteria) this;
        }

        public Criteria andDutyNameNotIn(List<String> values) {
            addCriterion("duty_name not in", values, "dutyName");
            return (Criteria) this;
        }

        public Criteria andDutyNameBetween(String value1, String value2) {
            addCriterion("duty_name between", value1, value2, "dutyName");
            return (Criteria) this;
        }

        public Criteria andDutyNameNotBetween(String value1, String value2) {
            addCriterion("duty_name not between", value1, value2, "dutyName");
            return (Criteria) this;
        }

        public Criteria andGridCodeIsNull() {
            addCriterion("grid_code is null");
            return (Criteria) this;
        }

        public Criteria andGridCodeIsNotNull() {
            addCriterion("grid_code is not null");
            return (Criteria) this;
        }

        public Criteria andGridCodeEqualTo(String value) {
            addCriterion("grid_code =", value, "gridCode");
            return (Criteria) this;
        }

        public Criteria andGridCodeNotEqualTo(String value) {
            addCriterion("grid_code <>", value, "gridCode");
            return (Criteria) this;
        }

        public Criteria andGridCodeGreaterThan(String value) {
            addCriterion("grid_code >", value, "gridCode");
            return (Criteria) this;
        }

        public Criteria andGridCodeGreaterThanOrEqualTo(String value) {
            addCriterion("grid_code >=", value, "gridCode");
            return (Criteria) this;
        }

        public Criteria andGridCodeLessThan(String value) {
            addCriterion("grid_code <", value, "gridCode");
            return (Criteria) this;
        }

        public Criteria andGridCodeLessThanOrEqualTo(String value) {
            addCriterion("grid_code <=", value, "gridCode");
            return (Criteria) this;
        }

        public Criteria andGridCodeLike(String value) {
            addCriterion("grid_code like", value, "gridCode");
            return (Criteria) this;
        }

        public Criteria andGridCodeNotLike(String value) {
            addCriterion("grid_code not like", value, "gridCode");
            return (Criteria) this;
        }

        public Criteria andGridCodeIn(List<String> values) {
            addCriterion("grid_code in", values, "gridCode");
            return (Criteria) this;
        }

        public Criteria andGridCodeNotIn(List<String> values) {
            addCriterion("grid_code not in", values, "gridCode");
            return (Criteria) this;
        }

        public Criteria andGridCodeBetween(String value1, String value2) {
            addCriterion("grid_code between", value1, value2, "gridCode");
            return (Criteria) this;
        }

        public Criteria andGridCodeNotBetween(String value1, String value2) {
            addCriterion("grid_code not between", value1, value2, "gridCode");
            return (Criteria) this;
        }

        public Criteria andGridNameIsNull() {
            addCriterion("grid_name is null");
            return (Criteria) this;
        }

        public Criteria andGridNameIsNotNull() {
            addCriterion("grid_name is not null");
            return (Criteria) this;
        }

        public Criteria andGridNameEqualTo(String value) {
            addCriterion("grid_name =", value, "gridName");
            return (Criteria) this;
        }

        public Criteria andGridNameNotEqualTo(String value) {
            addCriterion("grid_name <>", value, "gridName");
            return (Criteria) this;
        }

        public Criteria andGridNameGreaterThan(String value) {
            addCriterion("grid_name >", value, "gridName");
            return (Criteria) this;
        }

        public Criteria andGridNameGreaterThanOrEqualTo(String value) {
            addCriterion("grid_name >=", value, "gridName");
            return (Criteria) this;
        }

        public Criteria andGridNameLessThan(String value) {
            addCriterion("grid_name <", value, "gridName");
            return (Criteria) this;
        }

        public Criteria andGridNameLessThanOrEqualTo(String value) {
            addCriterion("grid_name <=", value, "gridName");
            return (Criteria) this;
        }

        public Criteria andGridNameLike(String value) {
            addCriterion("grid_name like", value, "gridName");
            return (Criteria) this;
        }

        public Criteria andGridNameNotLike(String value) {
            addCriterion("grid_name not like", value, "gridName");
            return (Criteria) this;
        }

        public Criteria andGridNameIn(List<String> values) {
            addCriterion("grid_name in", values, "gridName");
            return (Criteria) this;
        }

        public Criteria andGridNameNotIn(List<String> values) {
            addCriterion("grid_name not in", values, "gridName");
            return (Criteria) this;
        }

        public Criteria andGridNameBetween(String value1, String value2) {
            addCriterion("grid_name between", value1, value2, "gridName");
            return (Criteria) this;
        }

        public Criteria andGridNameNotBetween(String value1, String value2) {
            addCriterion("grid_name not between", value1, value2, "gridName");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeIsNull() {
            addCriterion("data_updatetime is null");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeIsNotNull() {
            addCriterion("data_updatetime is not null");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeEqualTo(String value) {
            addCriterion("data_updatetime =", value, "dataUpdatetime");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeNotEqualTo(String value) {
            addCriterion("data_updatetime <>", value, "dataUpdatetime");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeGreaterThan(String value) {
            addCriterion("data_updatetime >", value, "dataUpdatetime");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeGreaterThanOrEqualTo(String value) {
            addCriterion("data_updatetime >=", value, "dataUpdatetime");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeLessThan(String value) {
            addCriterion("data_updatetime <", value, "dataUpdatetime");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeLessThanOrEqualTo(String value) {
            addCriterion("data_updatetime <=", value, "dataUpdatetime");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeLike(String value) {
            addCriterion("data_updatetime like", value, "dataUpdatetime");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeNotLike(String value) {
            addCriterion("data_updatetime not like", value, "dataUpdatetime");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeIn(List<String> values) {
            addCriterion("data_updatetime in", values, "dataUpdatetime");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeNotIn(List<String> values) {
            addCriterion("data_updatetime not in", values, "dataUpdatetime");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeBetween(String value1, String value2) {
            addCriterion("data_updatetime between", value1, value2, "dataUpdatetime");
            return (Criteria) this;
        }

        public Criteria andDataUpdatetimeNotBetween(String value1, String value2) {
            addCriterion("data_updatetime not between", value1, value2, "dataUpdatetime");
            return (Criteria) this;
        }

        public Criteria andQita1IsNull() {
            addCriterion("qita1 is null");
            return (Criteria) this;
        }

        public Criteria andQita1IsNotNull() {
            addCriterion("qita1 is not null");
            return (Criteria) this;
        }

        public Criteria andQita1EqualTo(String value) {
            addCriterion("qita1 =", value, "qita1");
            return (Criteria) this;
        }

        public Criteria andQita1NotEqualTo(String value) {
            addCriterion("qita1 <>", value, "qita1");
            return (Criteria) this;
        }

        public Criteria andQita1GreaterThan(String value) {
            addCriterion("qita1 >", value, "qita1");
            return (Criteria) this;
        }

        public Criteria andQita1GreaterThanOrEqualTo(String value) {
            addCriterion("qita1 >=", value, "qita1");
            return (Criteria) this;
        }

        public Criteria andQita1LessThan(String value) {
            addCriterion("qita1 <", value, "qita1");
            return (Criteria) this;
        }

        public Criteria andQita1LessThanOrEqualTo(String value) {
            addCriterion("qita1 <=", value, "qita1");
            return (Criteria) this;
        }

        public Criteria andQita1Like(String value) {
            addCriterion("qita1 like", value, "qita1");
            return (Criteria) this;
        }

        public Criteria andQita1NotLike(String value) {
            addCriterion("qita1 not like", value, "qita1");
            return (Criteria) this;
        }

        public Criteria andQita1In(List<String> values) {
            addCriterion("qita1 in", values, "qita1");
            return (Criteria) this;
        }

        public Criteria andQita1NotIn(List<String> values) {
            addCriterion("qita1 not in", values, "qita1");
            return (Criteria) this;
        }

        public Criteria andQita1Between(String value1, String value2) {
            addCriterion("qita1 between", value1, value2, "qita1");
            return (Criteria) this;
        }

        public Criteria andQita1NotBetween(String value1, String value2) {
            addCriterion("qita1 not between", value1, value2, "qita1");
            return (Criteria) this;
        }

        public Criteria andQita2IsNull() {
            addCriterion("qita2 is null");
            return (Criteria) this;
        }

        public Criteria andQita2IsNotNull() {
            addCriterion("qita2 is not null");
            return (Criteria) this;
        }

        public Criteria andQita2EqualTo(String value) {
            addCriterion("qita2 =", value, "qita2");
            return (Criteria) this;
        }

        public Criteria andQita2NotEqualTo(String value) {
            addCriterion("qita2 <>", value, "qita2");
            return (Criteria) this;
        }

        public Criteria andQita2GreaterThan(String value) {
            addCriterion("qita2 >", value, "qita2");
            return (Criteria) this;
        }

        public Criteria andQita2GreaterThanOrEqualTo(String value) {
            addCriterion("qita2 >=", value, "qita2");
            return (Criteria) this;
        }

        public Criteria andQita2LessThan(String value) {
            addCriterion("qita2 <", value, "qita2");
            return (Criteria) this;
        }

        public Criteria andQita2LessThanOrEqualTo(String value) {
            addCriterion("qita2 <=", value, "qita2");
            return (Criteria) this;
        }

        public Criteria andQita2Like(String value) {
            addCriterion("qita2 like", value, "qita2");
            return (Criteria) this;
        }

        public Criteria andQita2NotLike(String value) {
            addCriterion("qita2 not like", value, "qita2");
            return (Criteria) this;
        }

        public Criteria andQita2In(List<String> values) {
            addCriterion("qita2 in", values, "qita2");
            return (Criteria) this;
        }

        public Criteria andQita2NotIn(List<String> values) {
            addCriterion("qita2 not in", values, "qita2");
            return (Criteria) this;
        }

        public Criteria andQita2Between(String value1, String value2) {
            addCriterion("qita2 between", value1, value2, "qita2");
            return (Criteria) this;
        }

        public Criteria andQita2NotBetween(String value1, String value2) {
            addCriterion("qita2 not between", value1, value2, "qita2");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdIsNull() {
            addCriterion("create_user_id is null");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdIsNotNull() {
            addCriterion("create_user_id is not null");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdEqualTo(Integer value) {
            addCriterion("create_user_id =", value, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdNotEqualTo(Integer value) {
            addCriterion("create_user_id <>", value, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdGreaterThan(Integer value) {
            addCriterion("create_user_id >", value, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("create_user_id >=", value, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdLessThan(Integer value) {
            addCriterion("create_user_id <", value, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("create_user_id <=", value, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdIn(List<Integer> values) {
            addCriterion("create_user_id in", values, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdNotIn(List<Integer> values) {
            addCriterion("create_user_id not in", values, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdBetween(Integer value1, Integer value2) {
            addCriterion("create_user_id between", value1, value2, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("create_user_id not between", value1, value2, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameIsNull() {
            addCriterion("create_user_name is null");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameIsNotNull() {
            addCriterion("create_user_name is not null");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameEqualTo(String value) {
            addCriterion("create_user_name =", value, "createUserName");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameNotEqualTo(String value) {
            addCriterion("create_user_name <>", value, "createUserName");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameGreaterThan(String value) {
            addCriterion("create_user_name >", value, "createUserName");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameGreaterThanOrEqualTo(String value) {
            addCriterion("create_user_name >=", value, "createUserName");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameLessThan(String value) {
            addCriterion("create_user_name <", value, "createUserName");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameLessThanOrEqualTo(String value) {
            addCriterion("create_user_name <=", value, "createUserName");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameLike(String value) {
            addCriterion("create_user_name like", value, "createUserName");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameNotLike(String value) {
            addCriterion("create_user_name not like", value, "createUserName");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameIn(List<String> values) {
            addCriterion("create_user_name in", values, "createUserName");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameNotIn(List<String> values) {
            addCriterion("create_user_name not in", values, "createUserName");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameBetween(String value1, String value2) {
            addCriterion("create_user_name between", value1, value2, "createUserName");
            return (Criteria) this;
        }

        public Criteria andCreateUserNameNotBetween(String value1, String value2) {
            addCriterion("create_user_name not between", value1, value2, "createUserName");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andIsDeletedIsNull() {
            addCriterion("is_deleted is null");
            return (Criteria) this;
        }

        public Criteria andIsDeletedIsNotNull() {
            addCriterion("is_deleted is not null");
            return (Criteria) this;
        }

        public Criteria andIsDeletedEqualTo(Integer value) {
            addCriterion("is_deleted =", value, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedNotEqualTo(Integer value) {
            addCriterion("is_deleted <>", value, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedGreaterThan(Integer value) {
            addCriterion("is_deleted >", value, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedGreaterThanOrEqualTo(Integer value) {
            addCriterion("is_deleted >=", value, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedLessThan(Integer value) {
            addCriterion("is_deleted <", value, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedLessThanOrEqualTo(Integer value) {
            addCriterion("is_deleted <=", value, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedIn(List<Integer> values) {
            addCriterion("is_deleted in", values, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedNotIn(List<Integer> values) {
            addCriterion("is_deleted not in", values, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedBetween(Integer value1, Integer value2) {
            addCriterion("is_deleted between", value1, value2, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedNotBetween(Integer value1, Integer value2) {
            addCriterion("is_deleted not between", value1, value2, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andDeleteUserIdIsNull() {
            addCriterion("delete_user_id is null");
            return (Criteria) this;
        }

        public Criteria andDeleteUserIdIsNotNull() {
            addCriterion("delete_user_id is not null");
            return (Criteria) this;
        }

        public Criteria andDeleteUserIdEqualTo(Integer value) {
            addCriterion("delete_user_id =", value, "deleteUserId");
            return (Criteria) this;
        }

        public Criteria andDeleteUserIdNotEqualTo(Integer value) {
            addCriterion("delete_user_id <>", value, "deleteUserId");
            return (Criteria) this;
        }

        public Criteria andDeleteUserIdGreaterThan(Integer value) {
            addCriterion("delete_user_id >", value, "deleteUserId");
            return (Criteria) this;
        }

        public Criteria andDeleteUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("delete_user_id >=", value, "deleteUserId");
            return (Criteria) this;
        }

        public Criteria andDeleteUserIdLessThan(Integer value) {
            addCriterion("delete_user_id <", value, "deleteUserId");
            return (Criteria) this;
        }

        public Criteria andDeleteUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("delete_user_id <=", value, "deleteUserId");
            return (Criteria) this;
        }

        public Criteria andDeleteUserIdIn(List<Integer> values) {
            addCriterion("delete_user_id in", values, "deleteUserId");
            return (Criteria) this;
        }

        public Criteria andDeleteUserIdNotIn(List<Integer> values) {
            addCriterion("delete_user_id not in", values, "deleteUserId");
            return (Criteria) this;
        }

        public Criteria andDeleteUserIdBetween(Integer value1, Integer value2) {
            addCriterion("delete_user_id between", value1, value2, "deleteUserId");
            return (Criteria) this;
        }

        public Criteria andDeleteUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("delete_user_id not between", value1, value2, "deleteUserId");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameIsNull() {
            addCriterion("delete_user_name is null");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameIsNotNull() {
            addCriterion("delete_user_name is not null");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameEqualTo(String value) {
            addCriterion("delete_user_name =", value, "deleteUserName");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameNotEqualTo(String value) {
            addCriterion("delete_user_name <>", value, "deleteUserName");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameGreaterThan(String value) {
            addCriterion("delete_user_name >", value, "deleteUserName");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameGreaterThanOrEqualTo(String value) {
            addCriterion("delete_user_name >=", value, "deleteUserName");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameLessThan(String value) {
            addCriterion("delete_user_name <", value, "deleteUserName");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameLessThanOrEqualTo(String value) {
            addCriterion("delete_user_name <=", value, "deleteUserName");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameLike(String value) {
            addCriterion("delete_user_name like", value, "deleteUserName");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameNotLike(String value) {
            addCriterion("delete_user_name not like", value, "deleteUserName");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameIn(List<String> values) {
            addCriterion("delete_user_name in", values, "deleteUserName");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameNotIn(List<String> values) {
            addCriterion("delete_user_name not in", values, "deleteUserName");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameBetween(String value1, String value2) {
            addCriterion("delete_user_name between", value1, value2, "deleteUserName");
            return (Criteria) this;
        }

        public Criteria andDeleteUserNameNotBetween(String value1, String value2) {
            addCriterion("delete_user_name not between", value1, value2, "deleteUserName");
            return (Criteria) this;
        }

        public Criteria andDeleteTimeIsNull() {
            addCriterion("delete_time is null");
            return (Criteria) this;
        }

        public Criteria andDeleteTimeIsNotNull() {
            addCriterion("delete_time is not null");
            return (Criteria) this;
        }

        public Criteria andDeleteTimeEqualTo(Date value) {
            addCriterion("delete_time =", value, "deleteTime");
            return (Criteria) this;
        }

        public Criteria andDeleteTimeNotEqualTo(Date value) {
            addCriterion("delete_time <>", value, "deleteTime");
            return (Criteria) this;
        }

        public Criteria andDeleteTimeGreaterThan(Date value) {
            addCriterion("delete_time >", value, "deleteTime");
            return (Criteria) this;
        }

        public Criteria andDeleteTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("delete_time >=", value, "deleteTime");
            return (Criteria) this;
        }

        public Criteria andDeleteTimeLessThan(Date value) {
            addCriterion("delete_time <", value, "deleteTime");
            return (Criteria) this;
        }

        public Criteria andDeleteTimeLessThanOrEqualTo(Date value) {
            addCriterion("delete_time <=", value, "deleteTime");
            return (Criteria) this;
        }

        public Criteria andDeleteTimeIn(List<Date> values) {
            addCriterion("delete_time in", values, "deleteTime");
            return (Criteria) this;
        }

        public Criteria andDeleteTimeNotIn(List<Date> values) {
            addCriterion("delete_time not in", values, "deleteTime");
            return (Criteria) this;
        }

        public Criteria andDeleteTimeBetween(Date value1, Date value2) {
            addCriterion("delete_time between", value1, value2, "deleteTime");
            return (Criteria) this;
        }

        public Criteria andDeleteTimeNotBetween(Date value1, Date value2) {
            addCriterion("delete_time not between", value1, value2, "deleteTime");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("remark like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("remark not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("remark not between", value1, value2, "remark");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}