package com.tf.biz.check.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BizCheckDetailExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public BizCheckDetailExample() {
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

        public Criteria andPlanIdIsNull() {
            addCriterion("plan_id is null");
            return (Criteria) this;
        }

        public Criteria andPlanIdIsNotNull() {
            addCriterion("plan_id is not null");
            return (Criteria) this;
        }

        public Criteria andPlanIdEqualTo(Long value) {
            addCriterion("plan_id =", value, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdNotEqualTo(Long value) {
            addCriterion("plan_id <>", value, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdGreaterThan(Long value) {
            addCriterion("plan_id >", value, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdGreaterThanOrEqualTo(Long value) {
            addCriterion("plan_id >=", value, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdLessThan(Long value) {
            addCriterion("plan_id <", value, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdLessThanOrEqualTo(Long value) {
            addCriterion("plan_id <=", value, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdIn(List<Long> values) {
            addCriterion("plan_id in", values, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdNotIn(List<Long> values) {
            addCriterion("plan_id not in", values, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdBetween(Long value1, Long value2) {
            addCriterion("plan_id between", value1, value2, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdNotBetween(Long value1, Long value2) {
            addCriterion("plan_id not between", value1, value2, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanBatchIdIsNull() {
            addCriterion("plan_batch_id is null");
            return (Criteria) this;
        }

        public Criteria andPlanBatchIdIsNotNull() {
            addCriterion("plan_batch_id is not null");
            return (Criteria) this;
        }

        public Criteria andPlanBatchIdEqualTo(Long value) {
            addCriterion("plan_batch_id =", value, "planBatchId");
            return (Criteria) this;
        }

        public Criteria andPlanBatchIdNotEqualTo(Long value) {
            addCriterion("plan_batch_id <>", value, "planBatchId");
            return (Criteria) this;
        }

        public Criteria andPlanBatchIdGreaterThan(Long value) {
            addCriterion("plan_batch_id >", value, "planBatchId");
            return (Criteria) this;
        }

        public Criteria andPlanBatchIdGreaterThanOrEqualTo(Long value) {
            addCriterion("plan_batch_id >=", value, "planBatchId");
            return (Criteria) this;
        }

        public Criteria andPlanBatchIdLessThan(Long value) {
            addCriterion("plan_batch_id <", value, "planBatchId");
            return (Criteria) this;
        }

        public Criteria andPlanBatchIdLessThanOrEqualTo(Long value) {
            addCriterion("plan_batch_id <=", value, "planBatchId");
            return (Criteria) this;
        }

        public Criteria andPlanBatchIdIn(List<Long> values) {
            addCriterion("plan_batch_id in", values, "planBatchId");
            return (Criteria) this;
        }

        public Criteria andPlanBatchIdNotIn(List<Long> values) {
            addCriterion("plan_batch_id not in", values, "planBatchId");
            return (Criteria) this;
        }

        public Criteria andPlanBatchIdBetween(Long value1, Long value2) {
            addCriterion("plan_batch_id between", value1, value2, "planBatchId");
            return (Criteria) this;
        }

        public Criteria andPlanBatchIdNotBetween(Long value1, Long value2) {
            addCriterion("plan_batch_id not between", value1, value2, "planBatchId");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameIsNull() {
            addCriterion("plan_batch_name is null");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameIsNotNull() {
            addCriterion("plan_batch_name is not null");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameEqualTo(String value) {
            addCriterion("plan_batch_name =", value, "planBatchName");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameNotEqualTo(String value) {
            addCriterion("plan_batch_name <>", value, "planBatchName");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameGreaterThan(String value) {
            addCriterion("plan_batch_name >", value, "planBatchName");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameGreaterThanOrEqualTo(String value) {
            addCriterion("plan_batch_name >=", value, "planBatchName");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameLessThan(String value) {
            addCriterion("plan_batch_name <", value, "planBatchName");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameLessThanOrEqualTo(String value) {
            addCriterion("plan_batch_name <=", value, "planBatchName");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameLike(String value) {
            addCriterion("plan_batch_name like", value, "planBatchName");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameNotLike(String value) {
            addCriterion("plan_batch_name not like", value, "planBatchName");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameIn(List<String> values) {
            addCriterion("plan_batch_name in", values, "planBatchName");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameNotIn(List<String> values) {
            addCriterion("plan_batch_name not in", values, "planBatchName");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameBetween(String value1, String value2) {
            addCriterion("plan_batch_name between", value1, value2, "planBatchName");
            return (Criteria) this;
        }

        public Criteria andPlanBatchNameNotBetween(String value1, String value2) {
            addCriterion("plan_batch_name not between", value1, value2, "planBatchName");
            return (Criteria) this;
        }

        public Criteria andStoreIdIsNull() {
            addCriterion("store_id is null");
            return (Criteria) this;
        }

        public Criteria andStoreIdIsNotNull() {
            addCriterion("store_id is not null");
            return (Criteria) this;
        }

        public Criteria andStoreIdEqualTo(Long value) {
            addCriterion("store_id =", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdNotEqualTo(Long value) {
            addCriterion("store_id <>", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdGreaterThan(Long value) {
            addCriterion("store_id >", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdGreaterThanOrEqualTo(Long value) {
            addCriterion("store_id >=", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdLessThan(Long value) {
            addCriterion("store_id <", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdLessThanOrEqualTo(Long value) {
            addCriterion("store_id <=", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdIn(List<Long> values) {
            addCriterion("store_id in", values, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdNotIn(List<Long> values) {
            addCriterion("store_id not in", values, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdBetween(Long value1, Long value2) {
            addCriterion("store_id between", value1, value2, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdNotBetween(Long value1, Long value2) {
            addCriterion("store_id not between", value1, value2, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreCodeIsNull() {
            addCriterion("store_code is null");
            return (Criteria) this;
        }

        public Criteria andStoreCodeIsNotNull() {
            addCriterion("store_code is not null");
            return (Criteria) this;
        }

        public Criteria andStoreCodeEqualTo(String value) {
            addCriterion("store_code =", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeNotEqualTo(String value) {
            addCriterion("store_code <>", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeGreaterThan(String value) {
            addCriterion("store_code >", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeGreaterThanOrEqualTo(String value) {
            addCriterion("store_code >=", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeLessThan(String value) {
            addCriterion("store_code <", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeLessThanOrEqualTo(String value) {
            addCriterion("store_code <=", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeLike(String value) {
            addCriterion("store_code like", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeNotLike(String value) {
            addCriterion("store_code not like", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeIn(List<String> values) {
            addCriterion("store_code in", values, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeNotIn(List<String> values) {
            addCriterion("store_code not in", values, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeBetween(String value1, String value2) {
            addCriterion("store_code between", value1, value2, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeNotBetween(String value1, String value2) {
            addCriterion("store_code not between", value1, value2, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreNameIsNull() {
            addCriterion("store_name is null");
            return (Criteria) this;
        }

        public Criteria andStoreNameIsNotNull() {
            addCriterion("store_name is not null");
            return (Criteria) this;
        }

        public Criteria andStoreNameEqualTo(String value) {
            addCriterion("store_name =", value, "storeName");
            return (Criteria) this;
        }

        public Criteria andStoreNameNotEqualTo(String value) {
            addCriterion("store_name <>", value, "storeName");
            return (Criteria) this;
        }

        public Criteria andStoreNameGreaterThan(String value) {
            addCriterion("store_name >", value, "storeName");
            return (Criteria) this;
        }

        public Criteria andStoreNameGreaterThanOrEqualTo(String value) {
            addCriterion("store_name >=", value, "storeName");
            return (Criteria) this;
        }

        public Criteria andStoreNameLessThan(String value) {
            addCriterion("store_name <", value, "storeName");
            return (Criteria) this;
        }

        public Criteria andStoreNameLessThanOrEqualTo(String value) {
            addCriterion("store_name <=", value, "storeName");
            return (Criteria) this;
        }

        public Criteria andStoreNameLike(String value) {
            addCriterion("store_name like", value, "storeName");
            return (Criteria) this;
        }

        public Criteria andStoreNameNotLike(String value) {
            addCriterion("store_name not like", value, "storeName");
            return (Criteria) this;
        }

        public Criteria andStoreNameIn(List<String> values) {
            addCriterion("store_name in", values, "storeName");
            return (Criteria) this;
        }

        public Criteria andStoreNameNotIn(List<String> values) {
            addCriterion("store_name not in", values, "storeName");
            return (Criteria) this;
        }

        public Criteria andStoreNameBetween(String value1, String value2) {
            addCriterion("store_name between", value1, value2, "storeName");
            return (Criteria) this;
        }

        public Criteria andStoreNameNotBetween(String value1, String value2) {
            addCriterion("store_name not between", value1, value2, "storeName");
            return (Criteria) this;
        }

        public Criteria andStoreAddressIsNull() {
            addCriterion("store_address is null");
            return (Criteria) this;
        }

        public Criteria andStoreAddressIsNotNull() {
            addCriterion("store_address is not null");
            return (Criteria) this;
        }

        public Criteria andStoreAddressEqualTo(String value) {
            addCriterion("store_address =", value, "storeAddress");
            return (Criteria) this;
        }

        public Criteria andStoreAddressNotEqualTo(String value) {
            addCriterion("store_address <>", value, "storeAddress");
            return (Criteria) this;
        }

        public Criteria andStoreAddressGreaterThan(String value) {
            addCriterion("store_address >", value, "storeAddress");
            return (Criteria) this;
        }

        public Criteria andStoreAddressGreaterThanOrEqualTo(String value) {
            addCriterion("store_address >=", value, "storeAddress");
            return (Criteria) this;
        }

        public Criteria andStoreAddressLessThan(String value) {
            addCriterion("store_address <", value, "storeAddress");
            return (Criteria) this;
        }

        public Criteria andStoreAddressLessThanOrEqualTo(String value) {
            addCriterion("store_address <=", value, "storeAddress");
            return (Criteria) this;
        }

        public Criteria andStoreAddressLike(String value) {
            addCriterion("store_address like", value, "storeAddress");
            return (Criteria) this;
        }

        public Criteria andStoreAddressNotLike(String value) {
            addCriterion("store_address not like", value, "storeAddress");
            return (Criteria) this;
        }

        public Criteria andStoreAddressIn(List<String> values) {
            addCriterion("store_address in", values, "storeAddress");
            return (Criteria) this;
        }

        public Criteria andStoreAddressNotIn(List<String> values) {
            addCriterion("store_address not in", values, "storeAddress");
            return (Criteria) this;
        }

        public Criteria andStoreAddressBetween(String value1, String value2) {
            addCriterion("store_address between", value1, value2, "storeAddress");
            return (Criteria) this;
        }

        public Criteria andStoreAddressNotBetween(String value1, String value2) {
            addCriterion("store_address not between", value1, value2, "storeAddress");
            return (Criteria) this;
        }

        public Criteria andCheckTimeIsNull() {
            addCriterion("check_time is null");
            return (Criteria) this;
        }

        public Criteria andCheckTimeIsNotNull() {
            addCriterion("check_time is not null");
            return (Criteria) this;
        }

        public Criteria andCheckTimeEqualTo(Date value) {
            addCriterion("check_time =", value, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeNotEqualTo(Date value) {
            addCriterion("check_time <>", value, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeGreaterThan(Date value) {
            addCriterion("check_time >", value, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("check_time >=", value, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeLessThan(Date value) {
            addCriterion("check_time <", value, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeLessThanOrEqualTo(Date value) {
            addCriterion("check_time <=", value, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeIn(List<Date> values) {
            addCriterion("check_time in", values, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeNotIn(List<Date> values) {
            addCriterion("check_time not in", values, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeBetween(Date value1, Date value2) {
            addCriterion("check_time between", value1, value2, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeNotBetween(Date value1, Date value2) {
            addCriterion("check_time not between", value1, value2, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckUserIdIsNull() {
            addCriterion("check_user_id is null");
            return (Criteria) this;
        }

        public Criteria andCheckUserIdIsNotNull() {
            addCriterion("check_user_id is not null");
            return (Criteria) this;
        }

        public Criteria andCheckUserIdEqualTo(Long value) {
            addCriterion("check_user_id =", value, "checkUserId");
            return (Criteria) this;
        }

        public Criteria andCheckUserIdNotEqualTo(Long value) {
            addCriterion("check_user_id <>", value, "checkUserId");
            return (Criteria) this;
        }

        public Criteria andCheckUserIdGreaterThan(Long value) {
            addCriterion("check_user_id >", value, "checkUserId");
            return (Criteria) this;
        }

        public Criteria andCheckUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("check_user_id >=", value, "checkUserId");
            return (Criteria) this;
        }

        public Criteria andCheckUserIdLessThan(Long value) {
            addCriterion("check_user_id <", value, "checkUserId");
            return (Criteria) this;
        }

        public Criteria andCheckUserIdLessThanOrEqualTo(Long value) {
            addCriterion("check_user_id <=", value, "checkUserId");
            return (Criteria) this;
        }

        public Criteria andCheckUserIdIn(List<Long> values) {
            addCriterion("check_user_id in", values, "checkUserId");
            return (Criteria) this;
        }

        public Criteria andCheckUserIdNotIn(List<Long> values) {
            addCriterion("check_user_id not in", values, "checkUserId");
            return (Criteria) this;
        }

        public Criteria andCheckUserIdBetween(Long value1, Long value2) {
            addCriterion("check_user_id between", value1, value2, "checkUserId");
            return (Criteria) this;
        }

        public Criteria andCheckUserIdNotBetween(Long value1, Long value2) {
            addCriterion("check_user_id not between", value1, value2, "checkUserId");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameIsNull() {
            addCriterion("check_user_name is null");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameIsNotNull() {
            addCriterion("check_user_name is not null");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameEqualTo(String value) {
            addCriterion("check_user_name =", value, "checkUserName");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameNotEqualTo(String value) {
            addCriterion("check_user_name <>", value, "checkUserName");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameGreaterThan(String value) {
            addCriterion("check_user_name >", value, "checkUserName");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameGreaterThanOrEqualTo(String value) {
            addCriterion("check_user_name >=", value, "checkUserName");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameLessThan(String value) {
            addCriterion("check_user_name <", value, "checkUserName");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameLessThanOrEqualTo(String value) {
            addCriterion("check_user_name <=", value, "checkUserName");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameLike(String value) {
            addCriterion("check_user_name like", value, "checkUserName");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameNotLike(String value) {
            addCriterion("check_user_name not like", value, "checkUserName");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameIn(List<String> values) {
            addCriterion("check_user_name in", values, "checkUserName");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameNotIn(List<String> values) {
            addCriterion("check_user_name not in", values, "checkUserName");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameBetween(String value1, String value2) {
            addCriterion("check_user_name between", value1, value2, "checkUserName");
            return (Criteria) this;
        }

        public Criteria andCheckUserNameNotBetween(String value1, String value2) {
            addCriterion("check_user_name not between", value1, value2, "checkUserName");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneIsNull() {
            addCriterion("check_user_phone is null");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneIsNotNull() {
            addCriterion("check_user_phone is not null");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneEqualTo(String value) {
            addCriterion("check_user_phone =", value, "checkUserPhone");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneNotEqualTo(String value) {
            addCriterion("check_user_phone <>", value, "checkUserPhone");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneGreaterThan(String value) {
            addCriterion("check_user_phone >", value, "checkUserPhone");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("check_user_phone >=", value, "checkUserPhone");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneLessThan(String value) {
            addCriterion("check_user_phone <", value, "checkUserPhone");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneLessThanOrEqualTo(String value) {
            addCriterion("check_user_phone <=", value, "checkUserPhone");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneLike(String value) {
            addCriterion("check_user_phone like", value, "checkUserPhone");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneNotLike(String value) {
            addCriterion("check_user_phone not like", value, "checkUserPhone");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneIn(List<String> values) {
            addCriterion("check_user_phone in", values, "checkUserPhone");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneNotIn(List<String> values) {
            addCriterion("check_user_phone not in", values, "checkUserPhone");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneBetween(String value1, String value2) {
            addCriterion("check_user_phone between", value1, value2, "checkUserPhone");
            return (Criteria) this;
        }

        public Criteria andCheckUserPhoneNotBetween(String value1, String value2) {
            addCriterion("check_user_phone not between", value1, value2, "checkUserPhone");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeIsNull() {
            addCriterion("check_longitude is null");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeIsNotNull() {
            addCriterion("check_longitude is not null");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeEqualTo(String value) {
            addCriterion("check_longitude =", value, "checkLongitude");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeNotEqualTo(String value) {
            addCriterion("check_longitude <>", value, "checkLongitude");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeGreaterThan(String value) {
            addCriterion("check_longitude >", value, "checkLongitude");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeGreaterThanOrEqualTo(String value) {
            addCriterion("check_longitude >=", value, "checkLongitude");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeLessThan(String value) {
            addCriterion("check_longitude <", value, "checkLongitude");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeLessThanOrEqualTo(String value) {
            addCriterion("check_longitude <=", value, "checkLongitude");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeLike(String value) {
            addCriterion("check_longitude like", value, "checkLongitude");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeNotLike(String value) {
            addCriterion("check_longitude not like", value, "checkLongitude");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeIn(List<String> values) {
            addCriterion("check_longitude in", values, "checkLongitude");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeNotIn(List<String> values) {
            addCriterion("check_longitude not in", values, "checkLongitude");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeBetween(String value1, String value2) {
            addCriterion("check_longitude between", value1, value2, "checkLongitude");
            return (Criteria) this;
        }

        public Criteria andCheckLongitudeNotBetween(String value1, String value2) {
            addCriterion("check_longitude not between", value1, value2, "checkLongitude");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeIsNull() {
            addCriterion("check_latitude is null");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeIsNotNull() {
            addCriterion("check_latitude is not null");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeEqualTo(String value) {
            addCriterion("check_latitude =", value, "checkLatitude");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeNotEqualTo(String value) {
            addCriterion("check_latitude <>", value, "checkLatitude");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeGreaterThan(String value) {
            addCriterion("check_latitude >", value, "checkLatitude");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeGreaterThanOrEqualTo(String value) {
            addCriterion("check_latitude >=", value, "checkLatitude");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeLessThan(String value) {
            addCriterion("check_latitude <", value, "checkLatitude");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeLessThanOrEqualTo(String value) {
            addCriterion("check_latitude <=", value, "checkLatitude");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeLike(String value) {
            addCriterion("check_latitude like", value, "checkLatitude");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeNotLike(String value) {
            addCriterion("check_latitude not like", value, "checkLatitude");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeIn(List<String> values) {
            addCriterion("check_latitude in", values, "checkLatitude");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeNotIn(List<String> values) {
            addCriterion("check_latitude not in", values, "checkLatitude");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeBetween(String value1, String value2) {
            addCriterion("check_latitude between", value1, value2, "checkLatitude");
            return (Criteria) this;
        }

        public Criteria andCheckLatitudeNotBetween(String value1, String value2) {
            addCriterion("check_latitude not between", value1, value2, "checkLatitude");
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

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStoreExistsokIsNull() {
            addCriterion("store_existsok is null");
            return (Criteria) this;
        }

        public Criteria andStoreExistsokIsNotNull() {
            addCriterion("store_existsok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreExistsokEqualTo(Integer value) {
            addCriterion("store_existsok =", value, "storeExistsok");
            return (Criteria) this;
        }

        public Criteria andStoreExistsokNotEqualTo(Integer value) {
            addCriterion("store_existsok <>", value, "storeExistsok");
            return (Criteria) this;
        }

        public Criteria andStoreExistsokGreaterThan(Integer value) {
            addCriterion("store_existsok >", value, "storeExistsok");
            return (Criteria) this;
        }

        public Criteria andStoreExistsokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_existsok >=", value, "storeExistsok");
            return (Criteria) this;
        }

        public Criteria andStoreExistsokLessThan(Integer value) {
            addCriterion("store_existsok <", value, "storeExistsok");
            return (Criteria) this;
        }

        public Criteria andStoreExistsokLessThanOrEqualTo(Integer value) {
            addCriterion("store_existsok <=", value, "storeExistsok");
            return (Criteria) this;
        }

        public Criteria andStoreExistsokIn(List<Integer> values) {
            addCriterion("store_existsok in", values, "storeExistsok");
            return (Criteria) this;
        }

        public Criteria andStoreExistsokNotIn(List<Integer> values) {
            addCriterion("store_existsok not in", values, "storeExistsok");
            return (Criteria) this;
        }

        public Criteria andStoreExistsokBetween(Integer value1, Integer value2) {
            addCriterion("store_existsok between", value1, value2, "storeExistsok");
            return (Criteria) this;
        }

        public Criteria andStoreExistsokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_existsok not between", value1, value2, "storeExistsok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameokIsNull() {
            addCriterion("store_realnameok is null");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameokIsNotNull() {
            addCriterion("store_realnameok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameokEqualTo(Integer value) {
            addCriterion("store_realnameok =", value, "storeRealnameok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameokNotEqualTo(Integer value) {
            addCriterion("store_realnameok <>", value, "storeRealnameok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameokGreaterThan(Integer value) {
            addCriterion("store_realnameok >", value, "storeRealnameok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_realnameok >=", value, "storeRealnameok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameokLessThan(Integer value) {
            addCriterion("store_realnameok <", value, "storeRealnameok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameokLessThanOrEqualTo(Integer value) {
            addCriterion("store_realnameok <=", value, "storeRealnameok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameokIn(List<Integer> values) {
            addCriterion("store_realnameok in", values, "storeRealnameok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameokNotIn(List<Integer> values) {
            addCriterion("store_realnameok not in", values, "storeRealnameok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameokBetween(Integer value1, Integer value2) {
            addCriterion("store_realnameok between", value1, value2, "storeRealnameok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_realnameok not between", value1, value2, "storeRealnameok");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeIsNull() {
            addCriterion("store_check_city_code is null");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeIsNotNull() {
            addCriterion("store_check_city_code is not null");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeEqualTo(String value) {
            addCriterion("store_check_city_code =", value, "storeCheckCityCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeNotEqualTo(String value) {
            addCriterion("store_check_city_code <>", value, "storeCheckCityCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeGreaterThan(String value) {
            addCriterion("store_check_city_code >", value, "storeCheckCityCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeGreaterThanOrEqualTo(String value) {
            addCriterion("store_check_city_code >=", value, "storeCheckCityCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeLessThan(String value) {
            addCriterion("store_check_city_code <", value, "storeCheckCityCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeLessThanOrEqualTo(String value) {
            addCriterion("store_check_city_code <=", value, "storeCheckCityCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeLike(String value) {
            addCriterion("store_check_city_code like", value, "storeCheckCityCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeNotLike(String value) {
            addCriterion("store_check_city_code not like", value, "storeCheckCityCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeIn(List<String> values) {
            addCriterion("store_check_city_code in", values, "storeCheckCityCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeNotIn(List<String> values) {
            addCriterion("store_check_city_code not in", values, "storeCheckCityCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeBetween(String value1, String value2) {
            addCriterion("store_check_city_code between", value1, value2, "storeCheckCityCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityCodeNotBetween(String value1, String value2) {
            addCriterion("store_check_city_code not between", value1, value2, "storeCheckCityCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameIsNull() {
            addCriterion("store_check_city_name is null");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameIsNotNull() {
            addCriterion("store_check_city_name is not null");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameEqualTo(String value) {
            addCriterion("store_check_city_name =", value, "storeCheckCityName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameNotEqualTo(String value) {
            addCriterion("store_check_city_name <>", value, "storeCheckCityName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameGreaterThan(String value) {
            addCriterion("store_check_city_name >", value, "storeCheckCityName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameGreaterThanOrEqualTo(String value) {
            addCriterion("store_check_city_name >=", value, "storeCheckCityName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameLessThan(String value) {
            addCriterion("store_check_city_name <", value, "storeCheckCityName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameLessThanOrEqualTo(String value) {
            addCriterion("store_check_city_name <=", value, "storeCheckCityName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameLike(String value) {
            addCriterion("store_check_city_name like", value, "storeCheckCityName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameNotLike(String value) {
            addCriterion("store_check_city_name not like", value, "storeCheckCityName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameIn(List<String> values) {
            addCriterion("store_check_city_name in", values, "storeCheckCityName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameNotIn(List<String> values) {
            addCriterion("store_check_city_name not in", values, "storeCheckCityName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameBetween(String value1, String value2) {
            addCriterion("store_check_city_name between", value1, value2, "storeCheckCityName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckCityNameNotBetween(String value1, String value2) {
            addCriterion("store_check_city_name not between", value1, value2, "storeCheckCityName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeIsNull() {
            addCriterion("store_check_province_code is null");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeIsNotNull() {
            addCriterion("store_check_province_code is not null");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeEqualTo(String value) {
            addCriterion("store_check_province_code =", value, "storeCheckProvinceCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeNotEqualTo(String value) {
            addCriterion("store_check_province_code <>", value, "storeCheckProvinceCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeGreaterThan(String value) {
            addCriterion("store_check_province_code >", value, "storeCheckProvinceCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeGreaterThanOrEqualTo(String value) {
            addCriterion("store_check_province_code >=", value, "storeCheckProvinceCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeLessThan(String value) {
            addCriterion("store_check_province_code <", value, "storeCheckProvinceCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeLessThanOrEqualTo(String value) {
            addCriterion("store_check_province_code <=", value, "storeCheckProvinceCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeLike(String value) {
            addCriterion("store_check_province_code like", value, "storeCheckProvinceCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeNotLike(String value) {
            addCriterion("store_check_province_code not like", value, "storeCheckProvinceCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeIn(List<String> values) {
            addCriterion("store_check_province_code in", values, "storeCheckProvinceCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeNotIn(List<String> values) {
            addCriterion("store_check_province_code not in", values, "storeCheckProvinceCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeBetween(String value1, String value2) {
            addCriterion("store_check_province_code between", value1, value2, "storeCheckProvinceCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceCodeNotBetween(String value1, String value2) {
            addCriterion("store_check_province_code not between", value1, value2, "storeCheckProvinceCode");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameIsNull() {
            addCriterion("store_check_province_name is null");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameIsNotNull() {
            addCriterion("store_check_province_name is not null");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameEqualTo(String value) {
            addCriterion("store_check_province_name =", value, "storeCheckProvinceName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameNotEqualTo(String value) {
            addCriterion("store_check_province_name <>", value, "storeCheckProvinceName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameGreaterThan(String value) {
            addCriterion("store_check_province_name >", value, "storeCheckProvinceName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameGreaterThanOrEqualTo(String value) {
            addCriterion("store_check_province_name >=", value, "storeCheckProvinceName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameLessThan(String value) {
            addCriterion("store_check_province_name <", value, "storeCheckProvinceName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameLessThanOrEqualTo(String value) {
            addCriterion("store_check_province_name <=", value, "storeCheckProvinceName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameLike(String value) {
            addCriterion("store_check_province_name like", value, "storeCheckProvinceName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameNotLike(String value) {
            addCriterion("store_check_province_name not like", value, "storeCheckProvinceName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameIn(List<String> values) {
            addCriterion("store_check_province_name in", values, "storeCheckProvinceName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameNotIn(List<String> values) {
            addCriterion("store_check_province_name not in", values, "storeCheckProvinceName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameBetween(String value1, String value2) {
            addCriterion("store_check_province_name between", value1, value2, "storeCheckProvinceName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckProvinceNameNotBetween(String value1, String value2) {
            addCriterion("store_check_province_name not between", value1, value2, "storeCheckProvinceName");
            return (Criteria) this;
        }

        public Criteria andStoreCheckaddressIsNull() {
            addCriterion("store_checkaddress is null");
            return (Criteria) this;
        }

        public Criteria andStoreCheckaddressIsNotNull() {
            addCriterion("store_checkaddress is not null");
            return (Criteria) this;
        }

        public Criteria andStoreCheckaddressEqualTo(Integer value) {
            addCriterion("store_checkaddress =", value, "storeCheckaddress");
            return (Criteria) this;
        }

        public Criteria andStoreCheckaddressNotEqualTo(Integer value) {
            addCriterion("store_checkaddress <>", value, "storeCheckaddress");
            return (Criteria) this;
        }

        public Criteria andStoreCheckaddressGreaterThan(Integer value) {
            addCriterion("store_checkaddress >", value, "storeCheckaddress");
            return (Criteria) this;
        }

        public Criteria andStoreCheckaddressGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_checkaddress >=", value, "storeCheckaddress");
            return (Criteria) this;
        }

        public Criteria andStoreCheckaddressLessThan(Integer value) {
            addCriterion("store_checkaddress <", value, "storeCheckaddress");
            return (Criteria) this;
        }

        public Criteria andStoreCheckaddressLessThanOrEqualTo(Integer value) {
            addCriterion("store_checkaddress <=", value, "storeCheckaddress");
            return (Criteria) this;
        }

        public Criteria andStoreCheckaddressIn(List<Integer> values) {
            addCriterion("store_checkaddress in", values, "storeCheckaddress");
            return (Criteria) this;
        }

        public Criteria andStoreCheckaddressNotIn(List<Integer> values) {
            addCriterion("store_checkaddress not in", values, "storeCheckaddress");
            return (Criteria) this;
        }

        public Criteria andStoreCheckaddressBetween(Integer value1, Integer value2) {
            addCriterion("store_checkaddress between", value1, value2, "storeCheckaddress");
            return (Criteria) this;
        }

        public Criteria andStoreCheckaddressNotBetween(Integer value1, Integer value2) {
            addCriterion("store_checkaddress not between", value1, value2, "storeCheckaddress");
            return (Criteria) this;
        }

        public Criteria andStoreRegiontypeIsNull() {
            addCriterion("store_regiontype is null");
            return (Criteria) this;
        }

        public Criteria andStoreRegiontypeIsNotNull() {
            addCriterion("store_regiontype is not null");
            return (Criteria) this;
        }

        public Criteria andStoreRegiontypeEqualTo(Integer value) {
            addCriterion("store_regiontype =", value, "storeRegiontype");
            return (Criteria) this;
        }

        public Criteria andStoreRegiontypeNotEqualTo(Integer value) {
            addCriterion("store_regiontype <>", value, "storeRegiontype");
            return (Criteria) this;
        }

        public Criteria andStoreRegiontypeGreaterThan(Integer value) {
            addCriterion("store_regiontype >", value, "storeRegiontype");
            return (Criteria) this;
        }

        public Criteria andStoreRegiontypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_regiontype >=", value, "storeRegiontype");
            return (Criteria) this;
        }

        public Criteria andStoreRegiontypeLessThan(Integer value) {
            addCriterion("store_regiontype <", value, "storeRegiontype");
            return (Criteria) this;
        }

        public Criteria andStoreRegiontypeLessThanOrEqualTo(Integer value) {
            addCriterion("store_regiontype <=", value, "storeRegiontype");
            return (Criteria) this;
        }

        public Criteria andStoreRegiontypeIn(List<Integer> values) {
            addCriterion("store_regiontype in", values, "storeRegiontype");
            return (Criteria) this;
        }

        public Criteria andStoreRegiontypeNotIn(List<Integer> values) {
            addCriterion("store_regiontype not in", values, "storeRegiontype");
            return (Criteria) this;
        }

        public Criteria andStoreRegiontypeBetween(Integer value1, Integer value2) {
            addCriterion("store_regiontype between", value1, value2, "storeRegiontype");
            return (Criteria) this;
        }

        public Criteria andStoreRegiontypeNotBetween(Integer value1, Integer value2) {
            addCriterion("store_regiontype not between", value1, value2, "storeRegiontype");
            return (Criteria) this;
        }

        public Criteria andStoreMendiantypeIsNull() {
            addCriterion("store_mendiantype is null");
            return (Criteria) this;
        }

        public Criteria andStoreMendiantypeIsNotNull() {
            addCriterion("store_mendiantype is not null");
            return (Criteria) this;
        }

        public Criteria andStoreMendiantypeEqualTo(Integer value) {
            addCriterion("store_mendiantype =", value, "storeMendiantype");
            return (Criteria) this;
        }

        public Criteria andStoreMendiantypeNotEqualTo(Integer value) {
            addCriterion("store_mendiantype <>", value, "storeMendiantype");
            return (Criteria) this;
        }

        public Criteria andStoreMendiantypeGreaterThan(Integer value) {
            addCriterion("store_mendiantype >", value, "storeMendiantype");
            return (Criteria) this;
        }

        public Criteria andStoreMendiantypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_mendiantype >=", value, "storeMendiantype");
            return (Criteria) this;
        }

        public Criteria andStoreMendiantypeLessThan(Integer value) {
            addCriterion("store_mendiantype <", value, "storeMendiantype");
            return (Criteria) this;
        }

        public Criteria andStoreMendiantypeLessThanOrEqualTo(Integer value) {
            addCriterion("store_mendiantype <=", value, "storeMendiantype");
            return (Criteria) this;
        }

        public Criteria andStoreMendiantypeIn(List<Integer> values) {
            addCriterion("store_mendiantype in", values, "storeMendiantype");
            return (Criteria) this;
        }

        public Criteria andStoreMendiantypeNotIn(List<Integer> values) {
            addCriterion("store_mendiantype not in", values, "storeMendiantype");
            return (Criteria) this;
        }

        public Criteria andStoreMendiantypeBetween(Integer value1, Integer value2) {
            addCriterion("store_mendiantype between", value1, value2, "storeMendiantype");
            return (Criteria) this;
        }

        public Criteria andStoreMendiantypeNotBetween(Integer value1, Integer value2) {
            addCriterion("store_mendiantype not between", value1, value2, "storeMendiantype");
            return (Criteria) this;
        }

        public Criteria andStoreYtsqtypeIsNull() {
            addCriterion("store_ytsqtype is null");
            return (Criteria) this;
        }

        public Criteria andStoreYtsqtypeIsNotNull() {
            addCriterion("store_ytsqtype is not null");
            return (Criteria) this;
        }

        public Criteria andStoreYtsqtypeEqualTo(Integer value) {
            addCriterion("store_ytsqtype =", value, "storeYtsqtype");
            return (Criteria) this;
        }

        public Criteria andStoreYtsqtypeNotEqualTo(Integer value) {
            addCriterion("store_ytsqtype <>", value, "storeYtsqtype");
            return (Criteria) this;
        }

        public Criteria andStoreYtsqtypeGreaterThan(Integer value) {
            addCriterion("store_ytsqtype >", value, "storeYtsqtype");
            return (Criteria) this;
        }

        public Criteria andStoreYtsqtypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_ytsqtype >=", value, "storeYtsqtype");
            return (Criteria) this;
        }

        public Criteria andStoreYtsqtypeLessThan(Integer value) {
            addCriterion("store_ytsqtype <", value, "storeYtsqtype");
            return (Criteria) this;
        }

        public Criteria andStoreYtsqtypeLessThanOrEqualTo(Integer value) {
            addCriterion("store_ytsqtype <=", value, "storeYtsqtype");
            return (Criteria) this;
        }

        public Criteria andStoreYtsqtypeIn(List<Integer> values) {
            addCriterion("store_ytsqtype in", values, "storeYtsqtype");
            return (Criteria) this;
        }

        public Criteria andStoreYtsqtypeNotIn(List<Integer> values) {
            addCriterion("store_ytsqtype not in", values, "storeYtsqtype");
            return (Criteria) this;
        }

        public Criteria andStoreYtsqtypeBetween(Integer value1, Integer value2) {
            addCriterion("store_ytsqtype between", value1, value2, "storeYtsqtype");
            return (Criteria) this;
        }

        public Criteria andStoreYtsqtypeNotBetween(Integer value1, Integer value2) {
            addCriterion("store_ytsqtype not between", value1, value2, "storeYtsqtype");
            return (Criteria) this;
        }

        public Criteria andStoreAreatypeIsNull() {
            addCriterion("store_areatype is null");
            return (Criteria) this;
        }

        public Criteria andStoreAreatypeIsNotNull() {
            addCriterion("store_areatype is not null");
            return (Criteria) this;
        }

        public Criteria andStoreAreatypeEqualTo(Integer value) {
            addCriterion("store_areatype =", value, "storeAreatype");
            return (Criteria) this;
        }

        public Criteria andStoreAreatypeNotEqualTo(Integer value) {
            addCriterion("store_areatype <>", value, "storeAreatype");
            return (Criteria) this;
        }

        public Criteria andStoreAreatypeGreaterThan(Integer value) {
            addCriterion("store_areatype >", value, "storeAreatype");
            return (Criteria) this;
        }

        public Criteria andStoreAreatypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_areatype >=", value, "storeAreatype");
            return (Criteria) this;
        }

        public Criteria andStoreAreatypeLessThan(Integer value) {
            addCriterion("store_areatype <", value, "storeAreatype");
            return (Criteria) this;
        }

        public Criteria andStoreAreatypeLessThanOrEqualTo(Integer value) {
            addCriterion("store_areatype <=", value, "storeAreatype");
            return (Criteria) this;
        }

        public Criteria andStoreAreatypeIn(List<Integer> values) {
            addCriterion("store_areatype in", values, "storeAreatype");
            return (Criteria) this;
        }

        public Criteria andStoreAreatypeNotIn(List<Integer> values) {
            addCriterion("store_areatype not in", values, "storeAreatype");
            return (Criteria) this;
        }

        public Criteria andStoreAreatypeBetween(Integer value1, Integer value2) {
            addCriterion("store_areatype between", value1, value2, "storeAreatype");
            return (Criteria) this;
        }

        public Criteria andStoreAreatypeNotBetween(Integer value1, Integer value2) {
            addCriterion("store_areatype not between", value1, value2, "storeAreatype");
            return (Criteria) this;
        }

        public Criteria andStoreMemberstypeIsNull() {
            addCriterion("store_memberstype is null");
            return (Criteria) this;
        }

        public Criteria andStoreMemberstypeIsNotNull() {
            addCriterion("store_memberstype is not null");
            return (Criteria) this;
        }

        public Criteria andStoreMemberstypeEqualTo(Integer value) {
            addCriterion("store_memberstype =", value, "storeMemberstype");
            return (Criteria) this;
        }

        public Criteria andStoreMemberstypeNotEqualTo(Integer value) {
            addCriterion("store_memberstype <>", value, "storeMemberstype");
            return (Criteria) this;
        }

        public Criteria andStoreMemberstypeGreaterThan(Integer value) {
            addCriterion("store_memberstype >", value, "storeMemberstype");
            return (Criteria) this;
        }

        public Criteria andStoreMemberstypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_memberstype >=", value, "storeMemberstype");
            return (Criteria) this;
        }

        public Criteria andStoreMemberstypeLessThan(Integer value) {
            addCriterion("store_memberstype <", value, "storeMemberstype");
            return (Criteria) this;
        }

        public Criteria andStoreMemberstypeLessThanOrEqualTo(Integer value) {
            addCriterion("store_memberstype <=", value, "storeMemberstype");
            return (Criteria) this;
        }

        public Criteria andStoreMemberstypeIn(List<Integer> values) {
            addCriterion("store_memberstype in", values, "storeMemberstype");
            return (Criteria) this;
        }

        public Criteria andStoreMemberstypeNotIn(List<Integer> values) {
            addCriterion("store_memberstype not in", values, "storeMemberstype");
            return (Criteria) this;
        }

        public Criteria andStoreMemberstypeBetween(Integer value1, Integer value2) {
            addCriterion("store_memberstype between", value1, value2, "storeMemberstype");
            return (Criteria) this;
        }

        public Criteria andStoreMemberstypeNotBetween(Integer value1, Integer value2) {
            addCriterion("store_memberstype not between", value1, value2, "storeMemberstype");
            return (Criteria) this;
        }

        public Criteria andStoreNmonthChangeokIsNull() {
            addCriterion("store_nmonth_changeok is null");
            return (Criteria) this;
        }

        public Criteria andStoreNmonthChangeokIsNotNull() {
            addCriterion("store_nmonth_changeok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreNmonthChangeokEqualTo(Integer value) {
            addCriterion("store_nmonth_changeok =", value, "storeNmonthChangeok");
            return (Criteria) this;
        }

        public Criteria andStoreNmonthChangeokNotEqualTo(Integer value) {
            addCriterion("store_nmonth_changeok <>", value, "storeNmonthChangeok");
            return (Criteria) this;
        }

        public Criteria andStoreNmonthChangeokGreaterThan(Integer value) {
            addCriterion("store_nmonth_changeok >", value, "storeNmonthChangeok");
            return (Criteria) this;
        }

        public Criteria andStoreNmonthChangeokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_nmonth_changeok >=", value, "storeNmonthChangeok");
            return (Criteria) this;
        }

        public Criteria andStoreNmonthChangeokLessThan(Integer value) {
            addCriterion("store_nmonth_changeok <", value, "storeNmonthChangeok");
            return (Criteria) this;
        }

        public Criteria andStoreNmonthChangeokLessThanOrEqualTo(Integer value) {
            addCriterion("store_nmonth_changeok <=", value, "storeNmonthChangeok");
            return (Criteria) this;
        }

        public Criteria andStoreNmonthChangeokIn(List<Integer> values) {
            addCriterion("store_nmonth_changeok in", values, "storeNmonthChangeok");
            return (Criteria) this;
        }

        public Criteria andStoreNmonthChangeokNotIn(List<Integer> values) {
            addCriterion("store_nmonth_changeok not in", values, "storeNmonthChangeok");
            return (Criteria) this;
        }

        public Criteria andStoreNmonthChangeokBetween(Integer value1, Integer value2) {
            addCriterion("store_nmonth_changeok between", value1, value2, "storeNmonthChangeok");
            return (Criteria) this;
        }

        public Criteria andStoreNmonthChangeokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_nmonth_changeok not between", value1, value2, "storeNmonthChangeok");
            return (Criteria) this;
        }

        public Criteria andStoreBusyUsercountIsNull() {
            addCriterion("store_busy_usercount is null");
            return (Criteria) this;
        }

        public Criteria andStoreBusyUsercountIsNotNull() {
            addCriterion("store_busy_usercount is not null");
            return (Criteria) this;
        }

        public Criteria andStoreBusyUsercountEqualTo(Integer value) {
            addCriterion("store_busy_usercount =", value, "storeBusyUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreBusyUsercountNotEqualTo(Integer value) {
            addCriterion("store_busy_usercount <>", value, "storeBusyUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreBusyUsercountGreaterThan(Integer value) {
            addCriterion("store_busy_usercount >", value, "storeBusyUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreBusyUsercountGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_busy_usercount >=", value, "storeBusyUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreBusyUsercountLessThan(Integer value) {
            addCriterion("store_busy_usercount <", value, "storeBusyUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreBusyUsercountLessThanOrEqualTo(Integer value) {
            addCriterion("store_busy_usercount <=", value, "storeBusyUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreBusyUsercountIn(List<Integer> values) {
            addCriterion("store_busy_usercount in", values, "storeBusyUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreBusyUsercountNotIn(List<Integer> values) {
            addCriterion("store_busy_usercount not in", values, "storeBusyUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreBusyUsercountBetween(Integer value1, Integer value2) {
            addCriterion("store_busy_usercount between", value1, value2, "storeBusyUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreBusyUsercountNotBetween(Integer value1, Integer value2) {
            addCriterion("store_busy_usercount not between", value1, value2, "storeBusyUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreFreeUsercountIsNull() {
            addCriterion("store_free_usercount is null");
            return (Criteria) this;
        }

        public Criteria andStoreFreeUsercountIsNotNull() {
            addCriterion("store_free_usercount is not null");
            return (Criteria) this;
        }

        public Criteria andStoreFreeUsercountEqualTo(Integer value) {
            addCriterion("store_free_usercount =", value, "storeFreeUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreFreeUsercountNotEqualTo(Integer value) {
            addCriterion("store_free_usercount <>", value, "storeFreeUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreFreeUsercountGreaterThan(Integer value) {
            addCriterion("store_free_usercount >", value, "storeFreeUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreFreeUsercountGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_free_usercount >=", value, "storeFreeUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreFreeUsercountLessThan(Integer value) {
            addCriterion("store_free_usercount <", value, "storeFreeUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreFreeUsercountLessThanOrEqualTo(Integer value) {
            addCriterion("store_free_usercount <=", value, "storeFreeUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreFreeUsercountIn(List<Integer> values) {
            addCriterion("store_free_usercount in", values, "storeFreeUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreFreeUsercountNotIn(List<Integer> values) {
            addCriterion("store_free_usercount not in", values, "storeFreeUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreFreeUsercountBetween(Integer value1, Integer value2) {
            addCriterion("store_free_usercount between", value1, value2, "storeFreeUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreFreeUsercountNotBetween(Integer value1, Integer value2) {
            addCriterion("store_free_usercount not between", value1, value2, "storeFreeUsercount");
            return (Criteria) this;
        }

        public Criteria andStoreMemberBusscopeIsNull() {
            addCriterion("store_member_busscope is null");
            return (Criteria) this;
        }

        public Criteria andStoreMemberBusscopeIsNotNull() {
            addCriterion("store_member_busscope is not null");
            return (Criteria) this;
        }

        public Criteria andStoreMemberBusscopeEqualTo(Integer value) {
            addCriterion("store_member_busscope =", value, "storeMemberBusscope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberBusscopeNotEqualTo(Integer value) {
            addCriterion("store_member_busscope <>", value, "storeMemberBusscope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberBusscopeGreaterThan(Integer value) {
            addCriterion("store_member_busscope >", value, "storeMemberBusscope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberBusscopeGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_member_busscope >=", value, "storeMemberBusscope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberBusscopeLessThan(Integer value) {
            addCriterion("store_member_busscope <", value, "storeMemberBusscope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberBusscopeLessThanOrEqualTo(Integer value) {
            addCriterion("store_member_busscope <=", value, "storeMemberBusscope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberBusscopeIn(List<Integer> values) {
            addCriterion("store_member_busscope in", values, "storeMemberBusscope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberBusscopeNotIn(List<Integer> values) {
            addCriterion("store_member_busscope not in", values, "storeMemberBusscope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberBusscopeBetween(Integer value1, Integer value2) {
            addCriterion("store_member_busscope between", value1, value2, "storeMemberBusscope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberBusscopeNotBetween(Integer value1, Integer value2) {
            addCriterion("store_member_busscope not between", value1, value2, "storeMemberBusscope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTaocanScopeIsNull() {
            addCriterion("store_member_taocan_scope is null");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTaocanScopeIsNotNull() {
            addCriterion("store_member_taocan_scope is not null");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTaocanScopeEqualTo(Integer value) {
            addCriterion("store_member_taocan_scope =", value, "storeMemberTaocanScope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTaocanScopeNotEqualTo(Integer value) {
            addCriterion("store_member_taocan_scope <>", value, "storeMemberTaocanScope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTaocanScopeGreaterThan(Integer value) {
            addCriterion("store_member_taocan_scope >", value, "storeMemberTaocanScope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTaocanScopeGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_member_taocan_scope >=", value, "storeMemberTaocanScope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTaocanScopeLessThan(Integer value) {
            addCriterion("store_member_taocan_scope <", value, "storeMemberTaocanScope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTaocanScopeLessThanOrEqualTo(Integer value) {
            addCriterion("store_member_taocan_scope <=", value, "storeMemberTaocanScope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTaocanScopeIn(List<Integer> values) {
            addCriterion("store_member_taocan_scope in", values, "storeMemberTaocanScope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTaocanScopeNotIn(List<Integer> values) {
            addCriterion("store_member_taocan_scope not in", values, "storeMemberTaocanScope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTaocanScopeBetween(Integer value1, Integer value2) {
            addCriterion("store_member_taocan_scope between", value1, value2, "storeMemberTaocanScope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTaocanScopeNotBetween(Integer value1, Integer value2) {
            addCriterion("store_member_taocan_scope not between", value1, value2, "storeMemberTaocanScope");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTerminalPolicyIsNull() {
            addCriterion("store_member_terminal_policy is null");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTerminalPolicyIsNotNull() {
            addCriterion("store_member_terminal_policy is not null");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTerminalPolicyEqualTo(Integer value) {
            addCriterion("store_member_terminal_policy =", value, "storeMemberTerminalPolicy");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTerminalPolicyNotEqualTo(Integer value) {
            addCriterion("store_member_terminal_policy <>", value, "storeMemberTerminalPolicy");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTerminalPolicyGreaterThan(Integer value) {
            addCriterion("store_member_terminal_policy >", value, "storeMemberTerminalPolicy");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTerminalPolicyGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_member_terminal_policy >=", value, "storeMemberTerminalPolicy");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTerminalPolicyLessThan(Integer value) {
            addCriterion("store_member_terminal_policy <", value, "storeMemberTerminalPolicy");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTerminalPolicyLessThanOrEqualTo(Integer value) {
            addCriterion("store_member_terminal_policy <=", value, "storeMemberTerminalPolicy");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTerminalPolicyIn(List<Integer> values) {
            addCriterion("store_member_terminal_policy in", values, "storeMemberTerminalPolicy");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTerminalPolicyNotIn(List<Integer> values) {
            addCriterion("store_member_terminal_policy not in", values, "storeMemberTerminalPolicy");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTerminalPolicyBetween(Integer value1, Integer value2) {
            addCriterion("store_member_terminal_policy between", value1, value2, "storeMemberTerminalPolicy");
            return (Criteria) this;
        }

        public Criteria andStoreMemberTerminalPolicyNotBetween(Integer value1, Integer value2) {
            addCriterion("store_member_terminal_policy not between", value1, value2, "storeMemberTerminalPolicy");
            return (Criteria) this;
        }

        public Criteria andStoreMemeberActivesellokIsNull() {
            addCriterion("store_memeber_activesellok is null");
            return (Criteria) this;
        }

        public Criteria andStoreMemeberActivesellokIsNotNull() {
            addCriterion("store_memeber_activesellok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreMemeberActivesellokEqualTo(Integer value) {
            addCriterion("store_memeber_activesellok =", value, "storeMemeberActivesellok");
            return (Criteria) this;
        }

        public Criteria andStoreMemeberActivesellokNotEqualTo(Integer value) {
            addCriterion("store_memeber_activesellok <>", value, "storeMemeberActivesellok");
            return (Criteria) this;
        }

        public Criteria andStoreMemeberActivesellokGreaterThan(Integer value) {
            addCriterion("store_memeber_activesellok >", value, "storeMemeberActivesellok");
            return (Criteria) this;
        }

        public Criteria andStoreMemeberActivesellokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_memeber_activesellok >=", value, "storeMemeberActivesellok");
            return (Criteria) this;
        }

        public Criteria andStoreMemeberActivesellokLessThan(Integer value) {
            addCriterion("store_memeber_activesellok <", value, "storeMemeberActivesellok");
            return (Criteria) this;
        }

        public Criteria andStoreMemeberActivesellokLessThanOrEqualTo(Integer value) {
            addCriterion("store_memeber_activesellok <=", value, "storeMemeberActivesellok");
            return (Criteria) this;
        }

        public Criteria andStoreMemeberActivesellokIn(List<Integer> values) {
            addCriterion("store_memeber_activesellok in", values, "storeMemeberActivesellok");
            return (Criteria) this;
        }

        public Criteria andStoreMemeberActivesellokNotIn(List<Integer> values) {
            addCriterion("store_memeber_activesellok not in", values, "storeMemeberActivesellok");
            return (Criteria) this;
        }

        public Criteria andStoreMemeberActivesellokBetween(Integer value1, Integer value2) {
            addCriterion("store_memeber_activesellok between", value1, value2, "storeMemeberActivesellok");
            return (Criteria) this;
        }

        public Criteria andStoreMemeberActivesellokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_memeber_activesellok not between", value1, value2, "storeMemeberActivesellok");
            return (Criteria) this;
        }

        public Criteria andStore4gokIsNull() {
            addCriterion("store_4gok is null");
            return (Criteria) this;
        }

        public Criteria andStore4gokIsNotNull() {
            addCriterion("store_4gok is not null");
            return (Criteria) this;
        }

        public Criteria andStore4gokEqualTo(Integer value) {
            addCriterion("store_4gok =", value, "store4gok");
            return (Criteria) this;
        }

        public Criteria andStore4gokNotEqualTo(Integer value) {
            addCriterion("store_4gok <>", value, "store4gok");
            return (Criteria) this;
        }

        public Criteria andStore4gokGreaterThan(Integer value) {
            addCriterion("store_4gok >", value, "store4gok");
            return (Criteria) this;
        }

        public Criteria andStore4gokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_4gok >=", value, "store4gok");
            return (Criteria) this;
        }

        public Criteria andStore4gokLessThan(Integer value) {
            addCriterion("store_4gok <", value, "store4gok");
            return (Criteria) this;
        }

        public Criteria andStore4gokLessThanOrEqualTo(Integer value) {
            addCriterion("store_4gok <=", value, "store4gok");
            return (Criteria) this;
        }

        public Criteria andStore4gokIn(List<Integer> values) {
            addCriterion("store_4gok in", values, "store4gok");
            return (Criteria) this;
        }

        public Criteria andStore4gokNotIn(List<Integer> values) {
            addCriterion("store_4gok not in", values, "store4gok");
            return (Criteria) this;
        }

        public Criteria andStore4gokBetween(Integer value1, Integer value2) {
            addCriterion("store_4gok between", value1, value2, "store4gok");
            return (Criteria) this;
        }

        public Criteria andStore4gokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_4gok not between", value1, value2, "store4gok");
            return (Criteria) this;
        }

        public Criteria andStoreAllnetokIsNull() {
            addCriterion("store_allnetok is null");
            return (Criteria) this;
        }

        public Criteria andStoreAllnetokIsNotNull() {
            addCriterion("store_allnetok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreAllnetokEqualTo(Integer value) {
            addCriterion("store_allnetok =", value, "storeAllnetok");
            return (Criteria) this;
        }

        public Criteria andStoreAllnetokNotEqualTo(Integer value) {
            addCriterion("store_allnetok <>", value, "storeAllnetok");
            return (Criteria) this;
        }

        public Criteria andStoreAllnetokGreaterThan(Integer value) {
            addCriterion("store_allnetok >", value, "storeAllnetok");
            return (Criteria) this;
        }

        public Criteria andStoreAllnetokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_allnetok >=", value, "storeAllnetok");
            return (Criteria) this;
        }

        public Criteria andStoreAllnetokLessThan(Integer value) {
            addCriterion("store_allnetok <", value, "storeAllnetok");
            return (Criteria) this;
        }

        public Criteria andStoreAllnetokLessThanOrEqualTo(Integer value) {
            addCriterion("store_allnetok <=", value, "storeAllnetok");
            return (Criteria) this;
        }

        public Criteria andStoreAllnetokIn(List<Integer> values) {
            addCriterion("store_allnetok in", values, "storeAllnetok");
            return (Criteria) this;
        }

        public Criteria andStoreAllnetokNotIn(List<Integer> values) {
            addCriterion("store_allnetok not in", values, "storeAllnetok");
            return (Criteria) this;
        }

        public Criteria andStoreAllnetokBetween(Integer value1, Integer value2) {
            addCriterion("store_allnetok between", value1, value2, "storeAllnetok");
            return (Criteria) this;
        }

        public Criteria andStoreAllnetokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_allnetok not between", value1, value2, "storeAllnetok");
            return (Criteria) this;
        }

        public Criteria andStoreFirstRecdTerminalIsNull() {
            addCriterion("store_first_recd_terminal is null");
            return (Criteria) this;
        }

        public Criteria andStoreFirstRecdTerminalIsNotNull() {
            addCriterion("store_first_recd_terminal is not null");
            return (Criteria) this;
        }

        public Criteria andStoreFirstRecdTerminalEqualTo(Integer value) {
            addCriterion("store_first_recd_terminal =", value, "storeFirstRecdTerminal");
            return (Criteria) this;
        }

        public Criteria andStoreFirstRecdTerminalNotEqualTo(Integer value) {
            addCriterion("store_first_recd_terminal <>", value, "storeFirstRecdTerminal");
            return (Criteria) this;
        }

        public Criteria andStoreFirstRecdTerminalGreaterThan(Integer value) {
            addCriterion("store_first_recd_terminal >", value, "storeFirstRecdTerminal");
            return (Criteria) this;
        }

        public Criteria andStoreFirstRecdTerminalGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_first_recd_terminal >=", value, "storeFirstRecdTerminal");
            return (Criteria) this;
        }

        public Criteria andStoreFirstRecdTerminalLessThan(Integer value) {
            addCriterion("store_first_recd_terminal <", value, "storeFirstRecdTerminal");
            return (Criteria) this;
        }

        public Criteria andStoreFirstRecdTerminalLessThanOrEqualTo(Integer value) {
            addCriterion("store_first_recd_terminal <=", value, "storeFirstRecdTerminal");
            return (Criteria) this;
        }

        public Criteria andStoreFirstRecdTerminalIn(List<Integer> values) {
            addCriterion("store_first_recd_terminal in", values, "storeFirstRecdTerminal");
            return (Criteria) this;
        }

        public Criteria andStoreFirstRecdTerminalNotIn(List<Integer> values) {
            addCriterion("store_first_recd_terminal not in", values, "storeFirstRecdTerminal");
            return (Criteria) this;
        }

        public Criteria andStoreFirstRecdTerminalBetween(Integer value1, Integer value2) {
            addCriterion("store_first_recd_terminal between", value1, value2, "storeFirstRecdTerminal");
            return (Criteria) this;
        }

        public Criteria andStoreFirstRecdTerminalNotBetween(Integer value1, Integer value2) {
            addCriterion("store_first_recd_terminal not between", value1, value2, "storeFirstRecdTerminal");
            return (Criteria) this;
        }

        public Criteria andStoreHealthokIsNull() {
            addCriterion("store_healthok is null");
            return (Criteria) this;
        }

        public Criteria andStoreHealthokIsNotNull() {
            addCriterion("store_healthok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreHealthokEqualTo(Integer value) {
            addCriterion("store_healthok =", value, "storeHealthok");
            return (Criteria) this;
        }

        public Criteria andStoreHealthokNotEqualTo(Integer value) {
            addCriterion("store_healthok <>", value, "storeHealthok");
            return (Criteria) this;
        }

        public Criteria andStoreHealthokGreaterThan(Integer value) {
            addCriterion("store_healthok >", value, "storeHealthok");
            return (Criteria) this;
        }

        public Criteria andStoreHealthokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_healthok >=", value, "storeHealthok");
            return (Criteria) this;
        }

        public Criteria andStoreHealthokLessThan(Integer value) {
            addCriterion("store_healthok <", value, "storeHealthok");
            return (Criteria) this;
        }

        public Criteria andStoreHealthokLessThanOrEqualTo(Integer value) {
            addCriterion("store_healthok <=", value, "storeHealthok");
            return (Criteria) this;
        }

        public Criteria andStoreHealthokIn(List<Integer> values) {
            addCriterion("store_healthok in", values, "storeHealthok");
            return (Criteria) this;
        }

        public Criteria andStoreHealthokNotIn(List<Integer> values) {
            addCriterion("store_healthok not in", values, "storeHealthok");
            return (Criteria) this;
        }

        public Criteria andStoreHealthokBetween(Integer value1, Integer value2) {
            addCriterion("store_healthok between", value1, value2, "storeHealthok");
            return (Criteria) this;
        }

        public Criteria andStoreHealthokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_healthok not between", value1, value2, "storeHealthok");
            return (Criteria) this;
        }

        public Criteria andStoreConductokIsNull() {
            addCriterion("store_conductok is null");
            return (Criteria) this;
        }

        public Criteria andStoreConductokIsNotNull() {
            addCriterion("store_conductok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreConductokEqualTo(Integer value) {
            addCriterion("store_conductok =", value, "storeConductok");
            return (Criteria) this;
        }

        public Criteria andStoreConductokNotEqualTo(Integer value) {
            addCriterion("store_conductok <>", value, "storeConductok");
            return (Criteria) this;
        }

        public Criteria andStoreConductokGreaterThan(Integer value) {
            addCriterion("store_conductok >", value, "storeConductok");
            return (Criteria) this;
        }

        public Criteria andStoreConductokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_conductok >=", value, "storeConductok");
            return (Criteria) this;
        }

        public Criteria andStoreConductokLessThan(Integer value) {
            addCriterion("store_conductok <", value, "storeConductok");
            return (Criteria) this;
        }

        public Criteria andStoreConductokLessThanOrEqualTo(Integer value) {
            addCriterion("store_conductok <=", value, "storeConductok");
            return (Criteria) this;
        }

        public Criteria andStoreConductokIn(List<Integer> values) {
            addCriterion("store_conductok in", values, "storeConductok");
            return (Criteria) this;
        }

        public Criteria andStoreConductokNotIn(List<Integer> values) {
            addCriterion("store_conductok not in", values, "storeConductok");
            return (Criteria) this;
        }

        public Criteria andStoreConductokBetween(Integer value1, Integer value2) {
            addCriterion("store_conductok between", value1, value2, "storeConductok");
            return (Criteria) this;
        }

        public Criteria andStoreConductokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_conductok not between", value1, value2, "storeConductok");
            return (Criteria) this;
        }

        public Criteria andStoreDonglineokIsNull() {
            addCriterion("store_donglineok is null");
            return (Criteria) this;
        }

        public Criteria andStoreDonglineokIsNotNull() {
            addCriterion("store_donglineok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreDonglineokEqualTo(Integer value) {
            addCriterion("store_donglineok =", value, "storeDonglineok");
            return (Criteria) this;
        }

        public Criteria andStoreDonglineokNotEqualTo(Integer value) {
            addCriterion("store_donglineok <>", value, "storeDonglineok");
            return (Criteria) this;
        }

        public Criteria andStoreDonglineokGreaterThan(Integer value) {
            addCriterion("store_donglineok >", value, "storeDonglineok");
            return (Criteria) this;
        }

        public Criteria andStoreDonglineokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_donglineok >=", value, "storeDonglineok");
            return (Criteria) this;
        }

        public Criteria andStoreDonglineokLessThan(Integer value) {
            addCriterion("store_donglineok <", value, "storeDonglineok");
            return (Criteria) this;
        }

        public Criteria andStoreDonglineokLessThanOrEqualTo(Integer value) {
            addCriterion("store_donglineok <=", value, "storeDonglineok");
            return (Criteria) this;
        }

        public Criteria andStoreDonglineokIn(List<Integer> values) {
            addCriterion("store_donglineok in", values, "storeDonglineok");
            return (Criteria) this;
        }

        public Criteria andStoreDonglineokNotIn(List<Integer> values) {
            addCriterion("store_donglineok not in", values, "storeDonglineok");
            return (Criteria) this;
        }

        public Criteria andStoreDonglineokBetween(Integer value1, Integer value2) {
            addCriterion("store_donglineok between", value1, value2, "storeDonglineok");
            return (Criteria) this;
        }

        public Criteria andStoreDonglineokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_donglineok not between", value1, value2, "storeDonglineok");
            return (Criteria) this;
        }

        public Criteria andStoreMonthSalecountIsNull() {
            addCriterion("store_month_salecount is null");
            return (Criteria) this;
        }

        public Criteria andStoreMonthSalecountIsNotNull() {
            addCriterion("store_month_salecount is not null");
            return (Criteria) this;
        }

        public Criteria andStoreMonthSalecountEqualTo(Integer value) {
            addCriterion("store_month_salecount =", value, "storeMonthSalecount");
            return (Criteria) this;
        }

        public Criteria andStoreMonthSalecountNotEqualTo(Integer value) {
            addCriterion("store_month_salecount <>", value, "storeMonthSalecount");
            return (Criteria) this;
        }

        public Criteria andStoreMonthSalecountGreaterThan(Integer value) {
            addCriterion("store_month_salecount >", value, "storeMonthSalecount");
            return (Criteria) this;
        }

        public Criteria andStoreMonthSalecountGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_month_salecount >=", value, "storeMonthSalecount");
            return (Criteria) this;
        }

        public Criteria andStoreMonthSalecountLessThan(Integer value) {
            addCriterion("store_month_salecount <", value, "storeMonthSalecount");
            return (Criteria) this;
        }

        public Criteria andStoreMonthSalecountLessThanOrEqualTo(Integer value) {
            addCriterion("store_month_salecount <=", value, "storeMonthSalecount");
            return (Criteria) this;
        }

        public Criteria andStoreMonthSalecountIn(List<Integer> values) {
            addCriterion("store_month_salecount in", values, "storeMonthSalecount");
            return (Criteria) this;
        }

        public Criteria andStoreMonthSalecountNotIn(List<Integer> values) {
            addCriterion("store_month_salecount not in", values, "storeMonthSalecount");
            return (Criteria) this;
        }

        public Criteria andStoreMonthSalecountBetween(Integer value1, Integer value2) {
            addCriterion("store_month_salecount between", value1, value2, "storeMonthSalecount");
            return (Criteria) this;
        }

        public Criteria andStoreMonthSalecountNotBetween(Integer value1, Integer value2) {
            addCriterion("store_month_salecount not between", value1, value2, "storeMonthSalecount");
            return (Criteria) this;
        }

        public Criteria andStoreDifExpandabilityIsNull() {
            addCriterion("store_dif_expandability is null");
            return (Criteria) this;
        }

        public Criteria andStoreDifExpandabilityIsNotNull() {
            addCriterion("store_dif_expandability is not null");
            return (Criteria) this;
        }

        public Criteria andStoreDifExpandabilityEqualTo(Integer value) {
            addCriterion("store_dif_expandability =", value, "storeDifExpandability");
            return (Criteria) this;
        }

        public Criteria andStoreDifExpandabilityNotEqualTo(Integer value) {
            addCriterion("store_dif_expandability <>", value, "storeDifExpandability");
            return (Criteria) this;
        }

        public Criteria andStoreDifExpandabilityGreaterThan(Integer value) {
            addCriterion("store_dif_expandability >", value, "storeDifExpandability");
            return (Criteria) this;
        }

        public Criteria andStoreDifExpandabilityGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_dif_expandability >=", value, "storeDifExpandability");
            return (Criteria) this;
        }

        public Criteria andStoreDifExpandabilityLessThan(Integer value) {
            addCriterion("store_dif_expandability <", value, "storeDifExpandability");
            return (Criteria) this;
        }

        public Criteria andStoreDifExpandabilityLessThanOrEqualTo(Integer value) {
            addCriterion("store_dif_expandability <=", value, "storeDifExpandability");
            return (Criteria) this;
        }

        public Criteria andStoreDifExpandabilityIn(List<Integer> values) {
            addCriterion("store_dif_expandability in", values, "storeDifExpandability");
            return (Criteria) this;
        }

        public Criteria andStoreDifExpandabilityNotIn(List<Integer> values) {
            addCriterion("store_dif_expandability not in", values, "storeDifExpandability");
            return (Criteria) this;
        }

        public Criteria andStoreDifExpandabilityBetween(Integer value1, Integer value2) {
            addCriterion("store_dif_expandability between", value1, value2, "storeDifExpandability");
            return (Criteria) this;
        }

        public Criteria andStoreDifExpandabilityNotBetween(Integer value1, Integer value2) {
            addCriterion("store_dif_expandability not between", value1, value2, "storeDifExpandability");
            return (Criteria) this;
        }

        public Criteria andStoreDoortouokIsNull() {
            addCriterion("store_doortouok is null");
            return (Criteria) this;
        }

        public Criteria andStoreDoortouokIsNotNull() {
            addCriterion("store_doortouok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreDoortouokEqualTo(Integer value) {
            addCriterion("store_doortouok =", value, "storeDoortouok");
            return (Criteria) this;
        }

        public Criteria andStoreDoortouokNotEqualTo(Integer value) {
            addCriterion("store_doortouok <>", value, "storeDoortouok");
            return (Criteria) this;
        }

        public Criteria andStoreDoortouokGreaterThan(Integer value) {
            addCriterion("store_doortouok >", value, "storeDoortouok");
            return (Criteria) this;
        }

        public Criteria andStoreDoortouokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_doortouok >=", value, "storeDoortouok");
            return (Criteria) this;
        }

        public Criteria andStoreDoortouokLessThan(Integer value) {
            addCriterion("store_doortouok <", value, "storeDoortouok");
            return (Criteria) this;
        }

        public Criteria andStoreDoortouokLessThanOrEqualTo(Integer value) {
            addCriterion("store_doortouok <=", value, "storeDoortouok");
            return (Criteria) this;
        }

        public Criteria andStoreDoortouokIn(List<Integer> values) {
            addCriterion("store_doortouok in", values, "storeDoortouok");
            return (Criteria) this;
        }

        public Criteria andStoreDoortouokNotIn(List<Integer> values) {
            addCriterion("store_doortouok not in", values, "storeDoortouok");
            return (Criteria) this;
        }

        public Criteria andStoreDoortouokBetween(Integer value1, Integer value2) {
            addCriterion("store_doortouok between", value1, value2, "storeDoortouok");
            return (Criteria) this;
        }

        public Criteria andStoreDoortouokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_doortouok not between", value1, value2, "storeDoortouok");
            return (Criteria) this;
        }

        public Criteria andStoreDengxiangokIsNull() {
            addCriterion("store_dengxiangok is null");
            return (Criteria) this;
        }

        public Criteria andStoreDengxiangokIsNotNull() {
            addCriterion("store_dengxiangok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreDengxiangokEqualTo(Integer value) {
            addCriterion("store_dengxiangok =", value, "storeDengxiangok");
            return (Criteria) this;
        }

        public Criteria andStoreDengxiangokNotEqualTo(Integer value) {
            addCriterion("store_dengxiangok <>", value, "storeDengxiangok");
            return (Criteria) this;
        }

        public Criteria andStoreDengxiangokGreaterThan(Integer value) {
            addCriterion("store_dengxiangok >", value, "storeDengxiangok");
            return (Criteria) this;
        }

        public Criteria andStoreDengxiangokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_dengxiangok >=", value, "storeDengxiangok");
            return (Criteria) this;
        }

        public Criteria andStoreDengxiangokLessThan(Integer value) {
            addCriterion("store_dengxiangok <", value, "storeDengxiangok");
            return (Criteria) this;
        }

        public Criteria andStoreDengxiangokLessThanOrEqualTo(Integer value) {
            addCriterion("store_dengxiangok <=", value, "storeDengxiangok");
            return (Criteria) this;
        }

        public Criteria andStoreDengxiangokIn(List<Integer> values) {
            addCriterion("store_dengxiangok in", values, "storeDengxiangok");
            return (Criteria) this;
        }

        public Criteria andStoreDengxiangokNotIn(List<Integer> values) {
            addCriterion("store_dengxiangok not in", values, "storeDengxiangok");
            return (Criteria) this;
        }

        public Criteria andStoreDengxiangokBetween(Integer value1, Integer value2) {
            addCriterion("store_dengxiangok between", value1, value2, "storeDengxiangok");
            return (Criteria) this;
        }

        public Criteria andStoreDengxiangokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_dengxiangok not between", value1, value2, "storeDengxiangok");
            return (Criteria) this;
        }

        public Criteria andStoreBrandokIsNull() {
            addCriterion("store_brandok is null");
            return (Criteria) this;
        }

        public Criteria andStoreBrandokIsNotNull() {
            addCriterion("store_brandok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreBrandokEqualTo(Integer value) {
            addCriterion("store_brandok =", value, "storeBrandok");
            return (Criteria) this;
        }

        public Criteria andStoreBrandokNotEqualTo(Integer value) {
            addCriterion("store_brandok <>", value, "storeBrandok");
            return (Criteria) this;
        }

        public Criteria andStoreBrandokGreaterThan(Integer value) {
            addCriterion("store_brandok >", value, "storeBrandok");
            return (Criteria) this;
        }

        public Criteria andStoreBrandokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_brandok >=", value, "storeBrandok");
            return (Criteria) this;
        }

        public Criteria andStoreBrandokLessThan(Integer value) {
            addCriterion("store_brandok <", value, "storeBrandok");
            return (Criteria) this;
        }

        public Criteria andStoreBrandokLessThanOrEqualTo(Integer value) {
            addCriterion("store_brandok <=", value, "storeBrandok");
            return (Criteria) this;
        }

        public Criteria andStoreBrandokIn(List<Integer> values) {
            addCriterion("store_brandok in", values, "storeBrandok");
            return (Criteria) this;
        }

        public Criteria andStoreBrandokNotIn(List<Integer> values) {
            addCriterion("store_brandok not in", values, "storeBrandok");
            return (Criteria) this;
        }

        public Criteria andStoreBrandokBetween(Integer value1, Integer value2) {
            addCriterion("store_brandok between", value1, value2, "storeBrandok");
            return (Criteria) this;
        }

        public Criteria andStoreBrandokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_brandok not between", value1, value2, "storeBrandok");
            return (Criteria) this;
        }

        public Criteria andStoreQrcodeIsNull() {
            addCriterion("store_qrcode is null");
            return (Criteria) this;
        }

        public Criteria andStoreQrcodeIsNotNull() {
            addCriterion("store_qrcode is not null");
            return (Criteria) this;
        }

        public Criteria andStoreQrcodeEqualTo(Integer value) {
            addCriterion("store_qrcode =", value, "storeQrcode");
            return (Criteria) this;
        }

        public Criteria andStoreQrcodeNotEqualTo(Integer value) {
            addCriterion("store_qrcode <>", value, "storeQrcode");
            return (Criteria) this;
        }

        public Criteria andStoreQrcodeGreaterThan(Integer value) {
            addCriterion("store_qrcode >", value, "storeQrcode");
            return (Criteria) this;
        }

        public Criteria andStoreQrcodeGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_qrcode >=", value, "storeQrcode");
            return (Criteria) this;
        }

        public Criteria andStoreQrcodeLessThan(Integer value) {
            addCriterion("store_qrcode <", value, "storeQrcode");
            return (Criteria) this;
        }

        public Criteria andStoreQrcodeLessThanOrEqualTo(Integer value) {
            addCriterion("store_qrcode <=", value, "storeQrcode");
            return (Criteria) this;
        }

        public Criteria andStoreQrcodeIn(List<Integer> values) {
            addCriterion("store_qrcode in", values, "storeQrcode");
            return (Criteria) this;
        }

        public Criteria andStoreQrcodeNotIn(List<Integer> values) {
            addCriterion("store_qrcode not in", values, "storeQrcode");
            return (Criteria) this;
        }

        public Criteria andStoreQrcodeBetween(Integer value1, Integer value2) {
            addCriterion("store_qrcode between", value1, value2, "storeQrcode");
            return (Criteria) this;
        }

        public Criteria andStoreQrcodeNotBetween(Integer value1, Integer value2) {
            addCriterion("store_qrcode not between", value1, value2, "storeQrcode");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameNoticeokIsNull() {
            addCriterion("store_realname_noticeok is null");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameNoticeokIsNotNull() {
            addCriterion("store_realname_noticeok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameNoticeokEqualTo(Integer value) {
            addCriterion("store_realname_noticeok =", value, "storeRealnameNoticeok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameNoticeokNotEqualTo(Integer value) {
            addCriterion("store_realname_noticeok <>", value, "storeRealnameNoticeok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameNoticeokGreaterThan(Integer value) {
            addCriterion("store_realname_noticeok >", value, "storeRealnameNoticeok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameNoticeokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_realname_noticeok >=", value, "storeRealnameNoticeok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameNoticeokLessThan(Integer value) {
            addCriterion("store_realname_noticeok <", value, "storeRealnameNoticeok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameNoticeokLessThanOrEqualTo(Integer value) {
            addCriterion("store_realname_noticeok <=", value, "storeRealnameNoticeok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameNoticeokIn(List<Integer> values) {
            addCriterion("store_realname_noticeok in", values, "storeRealnameNoticeok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameNoticeokNotIn(List<Integer> values) {
            addCriterion("store_realname_noticeok not in", values, "storeRealnameNoticeok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameNoticeokBetween(Integer value1, Integer value2) {
            addCriterion("store_realname_noticeok between", value1, value2, "storeRealnameNoticeok");
            return (Criteria) this;
        }

        public Criteria andStoreRealnameNoticeokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_realname_noticeok not between", value1, value2, "storeRealnameNoticeok");
            return (Criteria) this;
        }

        public Criteria andStoreBackwallIsNull() {
            addCriterion("store_backwall is null");
            return (Criteria) this;
        }

        public Criteria andStoreBackwallIsNotNull() {
            addCriterion("store_backwall is not null");
            return (Criteria) this;
        }

        public Criteria andStoreBackwallEqualTo(Integer value) {
            addCriterion("store_backwall =", value, "storeBackwall");
            return (Criteria) this;
        }

        public Criteria andStoreBackwallNotEqualTo(Integer value) {
            addCriterion("store_backwall <>", value, "storeBackwall");
            return (Criteria) this;
        }

        public Criteria andStoreBackwallGreaterThan(Integer value) {
            addCriterion("store_backwall >", value, "storeBackwall");
            return (Criteria) this;
        }

        public Criteria andStoreBackwallGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_backwall >=", value, "storeBackwall");
            return (Criteria) this;
        }

        public Criteria andStoreBackwallLessThan(Integer value) {
            addCriterion("store_backwall <", value, "storeBackwall");
            return (Criteria) this;
        }

        public Criteria andStoreBackwallLessThanOrEqualTo(Integer value) {
            addCriterion("store_backwall <=", value, "storeBackwall");
            return (Criteria) this;
        }

        public Criteria andStoreBackwallIn(List<Integer> values) {
            addCriterion("store_backwall in", values, "storeBackwall");
            return (Criteria) this;
        }

        public Criteria andStoreBackwallNotIn(List<Integer> values) {
            addCriterion("store_backwall not in", values, "storeBackwall");
            return (Criteria) this;
        }

        public Criteria andStoreBackwallBetween(Integer value1, Integer value2) {
            addCriterion("store_backwall between", value1, value2, "storeBackwall");
            return (Criteria) this;
        }

        public Criteria andStoreBackwallNotBetween(Integer value1, Integer value2) {
            addCriterion("store_backwall not between", value1, value2, "storeBackwall");
            return (Criteria) this;
        }

        public Criteria andStoreBartieIsNull() {
            addCriterion("store_bartie is null");
            return (Criteria) this;
        }

        public Criteria andStoreBartieIsNotNull() {
            addCriterion("store_bartie is not null");
            return (Criteria) this;
        }

        public Criteria andStoreBartieEqualTo(Integer value) {
            addCriterion("store_bartie =", value, "storeBartie");
            return (Criteria) this;
        }

        public Criteria andStoreBartieNotEqualTo(Integer value) {
            addCriterion("store_bartie <>", value, "storeBartie");
            return (Criteria) this;
        }

        public Criteria andStoreBartieGreaterThan(Integer value) {
            addCriterion("store_bartie >", value, "storeBartie");
            return (Criteria) this;
        }

        public Criteria andStoreBartieGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_bartie >=", value, "storeBartie");
            return (Criteria) this;
        }

        public Criteria andStoreBartieLessThan(Integer value) {
            addCriterion("store_bartie <", value, "storeBartie");
            return (Criteria) this;
        }

        public Criteria andStoreBartieLessThanOrEqualTo(Integer value) {
            addCriterion("store_bartie <=", value, "storeBartie");
            return (Criteria) this;
        }

        public Criteria andStoreBartieIn(List<Integer> values) {
            addCriterion("store_bartie in", values, "storeBartie");
            return (Criteria) this;
        }

        public Criteria andStoreBartieNotIn(List<Integer> values) {
            addCriterion("store_bartie not in", values, "storeBartie");
            return (Criteria) this;
        }

        public Criteria andStoreBartieBetween(Integer value1, Integer value2) {
            addCriterion("store_bartie between", value1, value2, "storeBartie");
            return (Criteria) this;
        }

        public Criteria andStoreBartieNotBetween(Integer value1, Integer value2) {
            addCriterion("store_bartie not between", value1, value2, "storeBartie");
            return (Criteria) this;
        }

        public Criteria andStoreZqOppokIsNull() {
            addCriterion("store_zq_oppok is null");
            return (Criteria) this;
        }

        public Criteria andStoreZqOppokIsNotNull() {
            addCriterion("store_zq_oppok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreZqOppokEqualTo(Integer value) {
            addCriterion("store_zq_oppok =", value, "storeZqOppok");
            return (Criteria) this;
        }

        public Criteria andStoreZqOppokNotEqualTo(Integer value) {
            addCriterion("store_zq_oppok <>", value, "storeZqOppok");
            return (Criteria) this;
        }

        public Criteria andStoreZqOppokGreaterThan(Integer value) {
            addCriterion("store_zq_oppok >", value, "storeZqOppok");
            return (Criteria) this;
        }

        public Criteria andStoreZqOppokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_zq_oppok >=", value, "storeZqOppok");
            return (Criteria) this;
        }

        public Criteria andStoreZqOppokLessThan(Integer value) {
            addCriterion("store_zq_oppok <", value, "storeZqOppok");
            return (Criteria) this;
        }

        public Criteria andStoreZqOppokLessThanOrEqualTo(Integer value) {
            addCriterion("store_zq_oppok <=", value, "storeZqOppok");
            return (Criteria) this;
        }

        public Criteria andStoreZqOppokIn(List<Integer> values) {
            addCriterion("store_zq_oppok in", values, "storeZqOppok");
            return (Criteria) this;
        }

        public Criteria andStoreZqOppokNotIn(List<Integer> values) {
            addCriterion("store_zq_oppok not in", values, "storeZqOppok");
            return (Criteria) this;
        }

        public Criteria andStoreZqOppokBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_oppok between", value1, value2, "storeZqOppok");
            return (Criteria) this;
        }

        public Criteria andStoreZqOppokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_oppok not between", value1, value2, "storeZqOppok");
            return (Criteria) this;
        }

        public Criteria andStoreZqJinliokIsNull() {
            addCriterion("store_zq_jinliok is null");
            return (Criteria) this;
        }

        public Criteria andStoreZqJinliokIsNotNull() {
            addCriterion("store_zq_jinliok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreZqJinliokEqualTo(Integer value) {
            addCriterion("store_zq_jinliok =", value, "storeZqJinliok");
            return (Criteria) this;
        }

        public Criteria andStoreZqJinliokNotEqualTo(Integer value) {
            addCriterion("store_zq_jinliok <>", value, "storeZqJinliok");
            return (Criteria) this;
        }

        public Criteria andStoreZqJinliokGreaterThan(Integer value) {
            addCriterion("store_zq_jinliok >", value, "storeZqJinliok");
            return (Criteria) this;
        }

        public Criteria andStoreZqJinliokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_zq_jinliok >=", value, "storeZqJinliok");
            return (Criteria) this;
        }

        public Criteria andStoreZqJinliokLessThan(Integer value) {
            addCriterion("store_zq_jinliok <", value, "storeZqJinliok");
            return (Criteria) this;
        }

        public Criteria andStoreZqJinliokLessThanOrEqualTo(Integer value) {
            addCriterion("store_zq_jinliok <=", value, "storeZqJinliok");
            return (Criteria) this;
        }

        public Criteria andStoreZqJinliokIn(List<Integer> values) {
            addCriterion("store_zq_jinliok in", values, "storeZqJinliok");
            return (Criteria) this;
        }

        public Criteria andStoreZqJinliokNotIn(List<Integer> values) {
            addCriterion("store_zq_jinliok not in", values, "storeZqJinliok");
            return (Criteria) this;
        }

        public Criteria andStoreZqJinliokBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_jinliok between", value1, value2, "storeZqJinliok");
            return (Criteria) this;
        }

        public Criteria andStoreZqJinliokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_jinliok not between", value1, value2, "storeZqJinliok");
            return (Criteria) this;
        }

        public Criteria andStoreZqVivookIsNull() {
            addCriterion("store_zq_vivook is null");
            return (Criteria) this;
        }

        public Criteria andStoreZqVivookIsNotNull() {
            addCriterion("store_zq_vivook is not null");
            return (Criteria) this;
        }

        public Criteria andStoreZqVivookEqualTo(Integer value) {
            addCriterion("store_zq_vivook =", value, "storeZqVivook");
            return (Criteria) this;
        }

        public Criteria andStoreZqVivookNotEqualTo(Integer value) {
            addCriterion("store_zq_vivook <>", value, "storeZqVivook");
            return (Criteria) this;
        }

        public Criteria andStoreZqVivookGreaterThan(Integer value) {
            addCriterion("store_zq_vivook >", value, "storeZqVivook");
            return (Criteria) this;
        }

        public Criteria andStoreZqVivookGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_zq_vivook >=", value, "storeZqVivook");
            return (Criteria) this;
        }

        public Criteria andStoreZqVivookLessThan(Integer value) {
            addCriterion("store_zq_vivook <", value, "storeZqVivook");
            return (Criteria) this;
        }

        public Criteria andStoreZqVivookLessThanOrEqualTo(Integer value) {
            addCriterion("store_zq_vivook <=", value, "storeZqVivook");
            return (Criteria) this;
        }

        public Criteria andStoreZqVivookIn(List<Integer> values) {
            addCriterion("store_zq_vivook in", values, "storeZqVivook");
            return (Criteria) this;
        }

        public Criteria andStoreZqVivookNotIn(List<Integer> values) {
            addCriterion("store_zq_vivook not in", values, "storeZqVivook");
            return (Criteria) this;
        }

        public Criteria andStoreZqVivookBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_vivook between", value1, value2, "storeZqVivook");
            return (Criteria) this;
        }

        public Criteria andStoreZqVivookNotBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_vivook not between", value1, value2, "storeZqVivook");
            return (Criteria) this;
        }

        public Criteria andStoreZqHuaweiokIsNull() {
            addCriterion("store_zq_huaweiok is null");
            return (Criteria) this;
        }

        public Criteria andStoreZqHuaweiokIsNotNull() {
            addCriterion("store_zq_huaweiok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreZqHuaweiokEqualTo(Integer value) {
            addCriterion("store_zq_huaweiok =", value, "storeZqHuaweiok");
            return (Criteria) this;
        }

        public Criteria andStoreZqHuaweiokNotEqualTo(Integer value) {
            addCriterion("store_zq_huaweiok <>", value, "storeZqHuaweiok");
            return (Criteria) this;
        }

        public Criteria andStoreZqHuaweiokGreaterThan(Integer value) {
            addCriterion("store_zq_huaweiok >", value, "storeZqHuaweiok");
            return (Criteria) this;
        }

        public Criteria andStoreZqHuaweiokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_zq_huaweiok >=", value, "storeZqHuaweiok");
            return (Criteria) this;
        }

        public Criteria andStoreZqHuaweiokLessThan(Integer value) {
            addCriterion("store_zq_huaweiok <", value, "storeZqHuaweiok");
            return (Criteria) this;
        }

        public Criteria andStoreZqHuaweiokLessThanOrEqualTo(Integer value) {
            addCriterion("store_zq_huaweiok <=", value, "storeZqHuaweiok");
            return (Criteria) this;
        }

        public Criteria andStoreZqHuaweiokIn(List<Integer> values) {
            addCriterion("store_zq_huaweiok in", values, "storeZqHuaweiok");
            return (Criteria) this;
        }

        public Criteria andStoreZqHuaweiokNotIn(List<Integer> values) {
            addCriterion("store_zq_huaweiok not in", values, "storeZqHuaweiok");
            return (Criteria) this;
        }

        public Criteria andStoreZqHuaweiokBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_huaweiok between", value1, value2, "storeZqHuaweiok");
            return (Criteria) this;
        }

        public Criteria andStoreZqHuaweiokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_huaweiok not between", value1, value2, "storeZqHuaweiok");
            return (Criteria) this;
        }

        public Criteria andStoreZqSamsongokIsNull() {
            addCriterion("store_zq_samsongok is null");
            return (Criteria) this;
        }

        public Criteria andStoreZqSamsongokIsNotNull() {
            addCriterion("store_zq_samsongok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreZqSamsongokEqualTo(Integer value) {
            addCriterion("store_zq_samsongok =", value, "storeZqSamsongok");
            return (Criteria) this;
        }

        public Criteria andStoreZqSamsongokNotEqualTo(Integer value) {
            addCriterion("store_zq_samsongok <>", value, "storeZqSamsongok");
            return (Criteria) this;
        }

        public Criteria andStoreZqSamsongokGreaterThan(Integer value) {
            addCriterion("store_zq_samsongok >", value, "storeZqSamsongok");
            return (Criteria) this;
        }

        public Criteria andStoreZqSamsongokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_zq_samsongok >=", value, "storeZqSamsongok");
            return (Criteria) this;
        }

        public Criteria andStoreZqSamsongokLessThan(Integer value) {
            addCriterion("store_zq_samsongok <", value, "storeZqSamsongok");
            return (Criteria) this;
        }

        public Criteria andStoreZqSamsongokLessThanOrEqualTo(Integer value) {
            addCriterion("store_zq_samsongok <=", value, "storeZqSamsongok");
            return (Criteria) this;
        }

        public Criteria andStoreZqSamsongokIn(List<Integer> values) {
            addCriterion("store_zq_samsongok in", values, "storeZqSamsongok");
            return (Criteria) this;
        }

        public Criteria andStoreZqSamsongokNotIn(List<Integer> values) {
            addCriterion("store_zq_samsongok not in", values, "storeZqSamsongok");
            return (Criteria) this;
        }

        public Criteria andStoreZqSamsongokBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_samsongok between", value1, value2, "storeZqSamsongok");
            return (Criteria) this;
        }

        public Criteria andStoreZqSamsongokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_samsongok not between", value1, value2, "storeZqSamsongok");
            return (Criteria) this;
        }

        public Criteria andStoreZqAppleokIsNull() {
            addCriterion("store_zq_appleok is null");
            return (Criteria) this;
        }

        public Criteria andStoreZqAppleokIsNotNull() {
            addCriterion("store_zq_appleok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreZqAppleokEqualTo(Integer value) {
            addCriterion("store_zq_appleok =", value, "storeZqAppleok");
            return (Criteria) this;
        }

        public Criteria andStoreZqAppleokNotEqualTo(Integer value) {
            addCriterion("store_zq_appleok <>", value, "storeZqAppleok");
            return (Criteria) this;
        }

        public Criteria andStoreZqAppleokGreaterThan(Integer value) {
            addCriterion("store_zq_appleok >", value, "storeZqAppleok");
            return (Criteria) this;
        }

        public Criteria andStoreZqAppleokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_zq_appleok >=", value, "storeZqAppleok");
            return (Criteria) this;
        }

        public Criteria andStoreZqAppleokLessThan(Integer value) {
            addCriterion("store_zq_appleok <", value, "storeZqAppleok");
            return (Criteria) this;
        }

        public Criteria andStoreZqAppleokLessThanOrEqualTo(Integer value) {
            addCriterion("store_zq_appleok <=", value, "storeZqAppleok");
            return (Criteria) this;
        }

        public Criteria andStoreZqAppleokIn(List<Integer> values) {
            addCriterion("store_zq_appleok in", values, "storeZqAppleok");
            return (Criteria) this;
        }

        public Criteria andStoreZqAppleokNotIn(List<Integer> values) {
            addCriterion("store_zq_appleok not in", values, "storeZqAppleok");
            return (Criteria) this;
        }

        public Criteria andStoreZqAppleokBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_appleok between", value1, value2, "storeZqAppleok");
            return (Criteria) this;
        }

        public Criteria andStoreZqAppleokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_appleok not between", value1, value2, "storeZqAppleok");
            return (Criteria) this;
        }

        public Criteria andStoreZqMeizuokIsNull() {
            addCriterion("store_zq_meizuok is null");
            return (Criteria) this;
        }

        public Criteria andStoreZqMeizuokIsNotNull() {
            addCriterion("store_zq_meizuok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreZqMeizuokEqualTo(Integer value) {
            addCriterion("store_zq_meizuok =", value, "storeZqMeizuok");
            return (Criteria) this;
        }

        public Criteria andStoreZqMeizuokNotEqualTo(Integer value) {
            addCriterion("store_zq_meizuok <>", value, "storeZqMeizuok");
            return (Criteria) this;
        }

        public Criteria andStoreZqMeizuokGreaterThan(Integer value) {
            addCriterion("store_zq_meizuok >", value, "storeZqMeizuok");
            return (Criteria) this;
        }

        public Criteria andStoreZqMeizuokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_zq_meizuok >=", value, "storeZqMeizuok");
            return (Criteria) this;
        }

        public Criteria andStoreZqMeizuokLessThan(Integer value) {
            addCriterion("store_zq_meizuok <", value, "storeZqMeizuok");
            return (Criteria) this;
        }

        public Criteria andStoreZqMeizuokLessThanOrEqualTo(Integer value) {
            addCriterion("store_zq_meizuok <=", value, "storeZqMeizuok");
            return (Criteria) this;
        }

        public Criteria andStoreZqMeizuokIn(List<Integer> values) {
            addCriterion("store_zq_meizuok in", values, "storeZqMeizuok");
            return (Criteria) this;
        }

        public Criteria andStoreZqMeizuokNotIn(List<Integer> values) {
            addCriterion("store_zq_meizuok not in", values, "storeZqMeizuok");
            return (Criteria) this;
        }

        public Criteria andStoreZqMeizuokBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_meizuok between", value1, value2, "storeZqMeizuok");
            return (Criteria) this;
        }

        public Criteria andStoreZqMeizuokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_meizuok not between", value1, value2, "storeZqMeizuok");
            return (Criteria) this;
        }

        public Criteria andStoreZq2g3gokIsNull() {
            addCriterion("store_zq_2g3gok is null");
            return (Criteria) this;
        }

        public Criteria andStoreZq2g3gokIsNotNull() {
            addCriterion("store_zq_2g3gok is not null");
            return (Criteria) this;
        }

        public Criteria andStoreZq2g3gokEqualTo(Integer value) {
            addCriterion("store_zq_2g3gok =", value, "storeZq2g3gok");
            return (Criteria) this;
        }

        public Criteria andStoreZq2g3gokNotEqualTo(Integer value) {
            addCriterion("store_zq_2g3gok <>", value, "storeZq2g3gok");
            return (Criteria) this;
        }

        public Criteria andStoreZq2g3gokGreaterThan(Integer value) {
            addCriterion("store_zq_2g3gok >", value, "storeZq2g3gok");
            return (Criteria) this;
        }

        public Criteria andStoreZq2g3gokGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_zq_2g3gok >=", value, "storeZq2g3gok");
            return (Criteria) this;
        }

        public Criteria andStoreZq2g3gokLessThan(Integer value) {
            addCriterion("store_zq_2g3gok <", value, "storeZq2g3gok");
            return (Criteria) this;
        }

        public Criteria andStoreZq2g3gokLessThanOrEqualTo(Integer value) {
            addCriterion("store_zq_2g3gok <=", value, "storeZq2g3gok");
            return (Criteria) this;
        }

        public Criteria andStoreZq2g3gokIn(List<Integer> values) {
            addCriterion("store_zq_2g3gok in", values, "storeZq2g3gok");
            return (Criteria) this;
        }

        public Criteria andStoreZq2g3gokNotIn(List<Integer> values) {
            addCriterion("store_zq_2g3gok not in", values, "storeZq2g3gok");
            return (Criteria) this;
        }

        public Criteria andStoreZq2g3gokBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_2g3gok between", value1, value2, "storeZq2g3gok");
            return (Criteria) this;
        }

        public Criteria andStoreZq2g3gokNotBetween(Integer value1, Integer value2) {
            addCriterion("store_zq_2g3gok not between", value1, value2, "storeZq2g3gok");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckOutcountIsNull() {
            addCriterion("store_kccheck_outcount is null");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckOutcountIsNotNull() {
            addCriterion("store_kccheck_outcount is not null");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckOutcountEqualTo(Integer value) {
            addCriterion("store_kccheck_outcount =", value, "storeKccheckOutcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckOutcountNotEqualTo(Integer value) {
            addCriterion("store_kccheck_outcount <>", value, "storeKccheckOutcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckOutcountGreaterThan(Integer value) {
            addCriterion("store_kccheck_outcount >", value, "storeKccheckOutcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckOutcountGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_kccheck_outcount >=", value, "storeKccheckOutcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckOutcountLessThan(Integer value) {
            addCriterion("store_kccheck_outcount <", value, "storeKccheckOutcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckOutcountLessThanOrEqualTo(Integer value) {
            addCriterion("store_kccheck_outcount <=", value, "storeKccheckOutcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckOutcountIn(List<Integer> values) {
            addCriterion("store_kccheck_outcount in", values, "storeKccheckOutcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckOutcountNotIn(List<Integer> values) {
            addCriterion("store_kccheck_outcount not in", values, "storeKccheckOutcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckOutcountBetween(Integer value1, Integer value2) {
            addCriterion("store_kccheck_outcount between", value1, value2, "storeKccheckOutcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckOutcountNotBetween(Integer value1, Integer value2) {
            addCriterion("store_kccheck_outcount not between", value1, value2, "storeKccheckOutcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckSelfcountIsNull() {
            addCriterion("store_kccheck_selfcount is null");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckSelfcountIsNotNull() {
            addCriterion("store_kccheck_selfcount is not null");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckSelfcountEqualTo(Integer value) {
            addCriterion("store_kccheck_selfcount =", value, "storeKccheckSelfcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckSelfcountNotEqualTo(Integer value) {
            addCriterion("store_kccheck_selfcount <>", value, "storeKccheckSelfcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckSelfcountGreaterThan(Integer value) {
            addCriterion("store_kccheck_selfcount >", value, "storeKccheckSelfcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckSelfcountGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_kccheck_selfcount >=", value, "storeKccheckSelfcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckSelfcountLessThan(Integer value) {
            addCriterion("store_kccheck_selfcount <", value, "storeKccheckSelfcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckSelfcountLessThanOrEqualTo(Integer value) {
            addCriterion("store_kccheck_selfcount <=", value, "storeKccheckSelfcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckSelfcountIn(List<Integer> values) {
            addCriterion("store_kccheck_selfcount in", values, "storeKccheckSelfcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckSelfcountNotIn(List<Integer> values) {
            addCriterion("store_kccheck_selfcount not in", values, "storeKccheckSelfcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckSelfcountBetween(Integer value1, Integer value2) {
            addCriterion("store_kccheck_selfcount between", value1, value2, "storeKccheckSelfcount");
            return (Criteria) this;
        }

        public Criteria andStoreKccheckSelfcountNotBetween(Integer value1, Integer value2) {
            addCriterion("store_kccheck_selfcount not between", value1, value2, "storeKccheckSelfcount");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1IsNull() {
            addCriterion("store_front_image1 is null");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1IsNotNull() {
            addCriterion("store_front_image1 is not null");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1EqualTo(String value) {
            addCriterion("store_front_image1 =", value, "storeFrontImage1");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1NotEqualTo(String value) {
            addCriterion("store_front_image1 <>", value, "storeFrontImage1");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1GreaterThan(String value) {
            addCriterion("store_front_image1 >", value, "storeFrontImage1");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1GreaterThanOrEqualTo(String value) {
            addCriterion("store_front_image1 >=", value, "storeFrontImage1");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1LessThan(String value) {
            addCriterion("store_front_image1 <", value, "storeFrontImage1");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1LessThanOrEqualTo(String value) {
            addCriterion("store_front_image1 <=", value, "storeFrontImage1");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1Like(String value) {
            addCriterion("store_front_image1 like", value, "storeFrontImage1");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1NotLike(String value) {
            addCriterion("store_front_image1 not like", value, "storeFrontImage1");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1In(List<String> values) {
            addCriterion("store_front_image1 in", values, "storeFrontImage1");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1NotIn(List<String> values) {
            addCriterion("store_front_image1 not in", values, "storeFrontImage1");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1Between(String value1, String value2) {
            addCriterion("store_front_image1 between", value1, value2, "storeFrontImage1");
            return (Criteria) this;
        }

        public Criteria andStoreFrontImage1NotBetween(String value1, String value2) {
            addCriterion("store_front_image1 not between", value1, value2, "storeFrontImage1");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2IsNull() {
            addCriterion("stroe_front_image2 is null");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2IsNotNull() {
            addCriterion("stroe_front_image2 is not null");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2EqualTo(String value) {
            addCriterion("stroe_front_image2 =", value, "stroeFrontImage2");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2NotEqualTo(String value) {
            addCriterion("stroe_front_image2 <>", value, "stroeFrontImage2");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2GreaterThan(String value) {
            addCriterion("stroe_front_image2 >", value, "stroeFrontImage2");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2GreaterThanOrEqualTo(String value) {
            addCriterion("stroe_front_image2 >=", value, "stroeFrontImage2");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2LessThan(String value) {
            addCriterion("stroe_front_image2 <", value, "stroeFrontImage2");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2LessThanOrEqualTo(String value) {
            addCriterion("stroe_front_image2 <=", value, "stroeFrontImage2");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2Like(String value) {
            addCriterion("stroe_front_image2 like", value, "stroeFrontImage2");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2NotLike(String value) {
            addCriterion("stroe_front_image2 not like", value, "stroeFrontImage2");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2In(List<String> values) {
            addCriterion("stroe_front_image2 in", values, "stroeFrontImage2");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2NotIn(List<String> values) {
            addCriterion("stroe_front_image2 not in", values, "stroeFrontImage2");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2Between(String value1, String value2) {
            addCriterion("stroe_front_image2 between", value1, value2, "stroeFrontImage2");
            return (Criteria) this;
        }

        public Criteria andStroeFrontImage2NotBetween(String value1, String value2) {
            addCriterion("stroe_front_image2 not between", value1, value2, "stroeFrontImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1IsNull() {
            addCriterion("stroe_linjie_image1 is null");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1IsNotNull() {
            addCriterion("stroe_linjie_image1 is not null");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1EqualTo(String value) {
            addCriterion("stroe_linjie_image1 =", value, "stroeLinjieImage1");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1NotEqualTo(String value) {
            addCriterion("stroe_linjie_image1 <>", value, "stroeLinjieImage1");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1GreaterThan(String value) {
            addCriterion("stroe_linjie_image1 >", value, "stroeLinjieImage1");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1GreaterThanOrEqualTo(String value) {
            addCriterion("stroe_linjie_image1 >=", value, "stroeLinjieImage1");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1LessThan(String value) {
            addCriterion("stroe_linjie_image1 <", value, "stroeLinjieImage1");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1LessThanOrEqualTo(String value) {
            addCriterion("stroe_linjie_image1 <=", value, "stroeLinjieImage1");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1Like(String value) {
            addCriterion("stroe_linjie_image1 like", value, "stroeLinjieImage1");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1NotLike(String value) {
            addCriterion("stroe_linjie_image1 not like", value, "stroeLinjieImage1");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1In(List<String> values) {
            addCriterion("stroe_linjie_image1 in", values, "stroeLinjieImage1");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1NotIn(List<String> values) {
            addCriterion("stroe_linjie_image1 not in", values, "stroeLinjieImage1");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1Between(String value1, String value2) {
            addCriterion("stroe_linjie_image1 between", value1, value2, "stroeLinjieImage1");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage1NotBetween(String value1, String value2) {
            addCriterion("stroe_linjie_image1 not between", value1, value2, "stroeLinjieImage1");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2IsNull() {
            addCriterion("stroe_linjie_image2 is null");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2IsNotNull() {
            addCriterion("stroe_linjie_image2 is not null");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2EqualTo(String value) {
            addCriterion("stroe_linjie_image2 =", value, "stroeLinjieImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2NotEqualTo(String value) {
            addCriterion("stroe_linjie_image2 <>", value, "stroeLinjieImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2GreaterThan(String value) {
            addCriterion("stroe_linjie_image2 >", value, "stroeLinjieImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2GreaterThanOrEqualTo(String value) {
            addCriterion("stroe_linjie_image2 >=", value, "stroeLinjieImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2LessThan(String value) {
            addCriterion("stroe_linjie_image2 <", value, "stroeLinjieImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2LessThanOrEqualTo(String value) {
            addCriterion("stroe_linjie_image2 <=", value, "stroeLinjieImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2Like(String value) {
            addCriterion("stroe_linjie_image2 like", value, "stroeLinjieImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2NotLike(String value) {
            addCriterion("stroe_linjie_image2 not like", value, "stroeLinjieImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2In(List<String> values) {
            addCriterion("stroe_linjie_image2 in", values, "stroeLinjieImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2NotIn(List<String> values) {
            addCriterion("stroe_linjie_image2 not in", values, "stroeLinjieImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2Between(String value1, String value2) {
            addCriterion("stroe_linjie_image2 between", value1, value2, "stroeLinjieImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage2NotBetween(String value1, String value2) {
            addCriterion("stroe_linjie_image2 not between", value1, value2, "stroeLinjieImage2");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3IsNull() {
            addCriterion("stroe_linjie_image3 is null");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3IsNotNull() {
            addCriterion("stroe_linjie_image3 is not null");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3EqualTo(String value) {
            addCriterion("stroe_linjie_image3 =", value, "stroeLinjieImage3");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3NotEqualTo(String value) {
            addCriterion("stroe_linjie_image3 <>", value, "stroeLinjieImage3");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3GreaterThan(String value) {
            addCriterion("stroe_linjie_image3 >", value, "stroeLinjieImage3");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3GreaterThanOrEqualTo(String value) {
            addCriterion("stroe_linjie_image3 >=", value, "stroeLinjieImage3");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3LessThan(String value) {
            addCriterion("stroe_linjie_image3 <", value, "stroeLinjieImage3");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3LessThanOrEqualTo(String value) {
            addCriterion("stroe_linjie_image3 <=", value, "stroeLinjieImage3");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3Like(String value) {
            addCriterion("stroe_linjie_image3 like", value, "stroeLinjieImage3");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3NotLike(String value) {
            addCriterion("stroe_linjie_image3 not like", value, "stroeLinjieImage3");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3In(List<String> values) {
            addCriterion("stroe_linjie_image3 in", values, "stroeLinjieImage3");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3NotIn(List<String> values) {
            addCriterion("stroe_linjie_image3 not in", values, "stroeLinjieImage3");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3Between(String value1, String value2) {
            addCriterion("stroe_linjie_image3 between", value1, value2, "stroeLinjieImage3");
            return (Criteria) this;
        }

        public Criteria andStroeLinjieImage3NotBetween(String value1, String value2) {
            addCriterion("stroe_linjie_image3 not between", value1, value2, "stroeLinjieImage3");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1IsNull() {
            addCriterion("store_guitai_image1 is null");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1IsNotNull() {
            addCriterion("store_guitai_image1 is not null");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1EqualTo(String value) {
            addCriterion("store_guitai_image1 =", value, "storeGuitaiImage1");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1NotEqualTo(String value) {
            addCriterion("store_guitai_image1 <>", value, "storeGuitaiImage1");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1GreaterThan(String value) {
            addCriterion("store_guitai_image1 >", value, "storeGuitaiImage1");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1GreaterThanOrEqualTo(String value) {
            addCriterion("store_guitai_image1 >=", value, "storeGuitaiImage1");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1LessThan(String value) {
            addCriterion("store_guitai_image1 <", value, "storeGuitaiImage1");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1LessThanOrEqualTo(String value) {
            addCriterion("store_guitai_image1 <=", value, "storeGuitaiImage1");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1Like(String value) {
            addCriterion("store_guitai_image1 like", value, "storeGuitaiImage1");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1NotLike(String value) {
            addCriterion("store_guitai_image1 not like", value, "storeGuitaiImage1");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1In(List<String> values) {
            addCriterion("store_guitai_image1 in", values, "storeGuitaiImage1");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1NotIn(List<String> values) {
            addCriterion("store_guitai_image1 not in", values, "storeGuitaiImage1");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1Between(String value1, String value2) {
            addCriterion("store_guitai_image1 between", value1, value2, "storeGuitaiImage1");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage1NotBetween(String value1, String value2) {
            addCriterion("store_guitai_image1 not between", value1, value2, "storeGuitaiImage1");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2IsNull() {
            addCriterion("store_guitai_image2 is null");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2IsNotNull() {
            addCriterion("store_guitai_image2 is not null");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2EqualTo(String value) {
            addCriterion("store_guitai_image2 =", value, "storeGuitaiImage2");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2NotEqualTo(String value) {
            addCriterion("store_guitai_image2 <>", value, "storeGuitaiImage2");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2GreaterThan(String value) {
            addCriterion("store_guitai_image2 >", value, "storeGuitaiImage2");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2GreaterThanOrEqualTo(String value) {
            addCriterion("store_guitai_image2 >=", value, "storeGuitaiImage2");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2LessThan(String value) {
            addCriterion("store_guitai_image2 <", value, "storeGuitaiImage2");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2LessThanOrEqualTo(String value) {
            addCriterion("store_guitai_image2 <=", value, "storeGuitaiImage2");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2Like(String value) {
            addCriterion("store_guitai_image2 like", value, "storeGuitaiImage2");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2NotLike(String value) {
            addCriterion("store_guitai_image2 not like", value, "storeGuitaiImage2");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2In(List<String> values) {
            addCriterion("store_guitai_image2 in", values, "storeGuitaiImage2");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2NotIn(List<String> values) {
            addCriterion("store_guitai_image2 not in", values, "storeGuitaiImage2");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2Between(String value1, String value2) {
            addCriterion("store_guitai_image2 between", value1, value2, "storeGuitaiImage2");
            return (Criteria) this;
        }

        public Criteria andStoreGuitaiImage2NotBetween(String value1, String value2) {
            addCriterion("store_guitai_image2 not between", value1, value2, "storeGuitaiImage2");
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