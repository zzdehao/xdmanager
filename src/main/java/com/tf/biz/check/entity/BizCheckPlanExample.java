package com.tf.biz.check.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BizCheckPlanExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public BizCheckPlanExample() {
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

        public Criteria andStoreCodeIsNull() {
            addCriterion("store_code is null");
            return (Criteria) this;
        }

        public Criteria andStoreCodeIsNotNull() {
            addCriterion("store_code is not null");
            return (Criteria) this;
        }

        public Criteria andStoreCodeEqualTo(Long value) {
            addCriterion("store_code =", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeNotEqualTo(Long value) {
            addCriterion("store_code <>", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeGreaterThan(Long value) {
            addCriterion("store_code >", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeGreaterThanOrEqualTo(Long value) {
            addCriterion("store_code >=", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeLessThan(Long value) {
            addCriterion("store_code <", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeLessThanOrEqualTo(Long value) {
            addCriterion("store_code <=", value, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeIn(List<Long> values) {
            addCriterion("store_code in", values, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeNotIn(List<Long> values) {
            addCriterion("store_code not in", values, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeBetween(Long value1, Long value2) {
            addCriterion("store_code between", value1, value2, "storeCode");
            return (Criteria) this;
        }

        public Criteria andStoreCodeNotBetween(Long value1, Long value2) {
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

        public Criteria andStoreIdIsNull() {
            addCriterion("store_id is null");
            return (Criteria) this;
        }

        public Criteria andStoreIdIsNotNull() {
            addCriterion("store_id is not null");
            return (Criteria) this;
        }

        public Criteria andStoreIdEqualTo(Integer value) {
            addCriterion("store_id =", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdNotEqualTo(Integer value) {
            addCriterion("store_id <>", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdGreaterThan(Integer value) {
            addCriterion("store_id >", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("store_id >=", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdLessThan(Integer value) {
            addCriterion("store_id <", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdLessThanOrEqualTo(Integer value) {
            addCriterion("store_id <=", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdIn(List<Integer> values) {
            addCriterion("store_id in", values, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdNotIn(List<Integer> values) {
            addCriterion("store_id not in", values, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdBetween(Integer value1, Integer value2) {
            addCriterion("store_id between", value1, value2, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdNotBetween(Integer value1, Integer value2) {
            addCriterion("store_id not between", value1, value2, "storeId");
            return (Criteria) this;
        }

        public Criteria andCheckUseridIsNull() {
            addCriterion("check_userid is null");
            return (Criteria) this;
        }

        public Criteria andCheckUseridIsNotNull() {
            addCriterion("check_userid is not null");
            return (Criteria) this;
        }

        public Criteria andCheckUseridEqualTo(Integer value) {
            addCriterion("check_userid =", value, "checkUserid");
            return (Criteria) this;
        }

        public Criteria andCheckUseridNotEqualTo(Integer value) {
            addCriterion("check_userid <>", value, "checkUserid");
            return (Criteria) this;
        }

        public Criteria andCheckUseridGreaterThan(Integer value) {
            addCriterion("check_userid >", value, "checkUserid");
            return (Criteria) this;
        }

        public Criteria andCheckUseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("check_userid >=", value, "checkUserid");
            return (Criteria) this;
        }

        public Criteria andCheckUseridLessThan(Integer value) {
            addCriterion("check_userid <", value, "checkUserid");
            return (Criteria) this;
        }

        public Criteria andCheckUseridLessThanOrEqualTo(Integer value) {
            addCriterion("check_userid <=", value, "checkUserid");
            return (Criteria) this;
        }

        public Criteria andCheckUseridIn(List<Integer> values) {
            addCriterion("check_userid in", values, "checkUserid");
            return (Criteria) this;
        }

        public Criteria andCheckUseridNotIn(List<Integer> values) {
            addCriterion("check_userid not in", values, "checkUserid");
            return (Criteria) this;
        }

        public Criteria andCheckUseridBetween(Integer value1, Integer value2) {
            addCriterion("check_userid between", value1, value2, "checkUserid");
            return (Criteria) this;
        }

        public Criteria andCheckUseridNotBetween(Integer value1, Integer value2) {
            addCriterion("check_userid not between", value1, value2, "checkUserid");
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

        public Criteria andChannelUserTelIsNull() {
            addCriterion("channel_user_tel is null");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelIsNotNull() {
            addCriterion("channel_user_tel is not null");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelEqualTo(String value) {
            addCriterion("channel_user_tel =", value, "channelUserTel");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelNotEqualTo(String value) {
            addCriterion("channel_user_tel <>", value, "channelUserTel");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelGreaterThan(String value) {
            addCriterion("channel_user_tel >", value, "channelUserTel");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelGreaterThanOrEqualTo(String value) {
            addCriterion("channel_user_tel >=", value, "channelUserTel");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelLessThan(String value) {
            addCriterion("channel_user_tel <", value, "channelUserTel");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelLessThanOrEqualTo(String value) {
            addCriterion("channel_user_tel <=", value, "channelUserTel");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelLike(String value) {
            addCriterion("channel_user_tel like", value, "channelUserTel");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelNotLike(String value) {
            addCriterion("channel_user_tel not like", value, "channelUserTel");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelIn(List<String> values) {
            addCriterion("channel_user_tel in", values, "channelUserTel");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelNotIn(List<String> values) {
            addCriterion("channel_user_tel not in", values, "channelUserTel");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelBetween(String value1, String value2) {
            addCriterion("channel_user_tel between", value1, value2, "channelUserTel");
            return (Criteria) this;
        }

        public Criteria andChannelUserTelNotBetween(String value1, String value2) {
            addCriterion("channel_user_tel not between", value1, value2, "channelUserTel");
            return (Criteria) this;
        }

        public Criteria andCheckStartDateIsNull() {
            addCriterion("check_start_date is null");
            return (Criteria) this;
        }

        public Criteria andCheckStartDateIsNotNull() {
            addCriterion("check_start_date is not null");
            return (Criteria) this;
        }

        public Criteria andCheckStartDateEqualTo(Date value) {
            addCriterion("check_start_date =", value, "checkStartDate");
            return (Criteria) this;
        }

        public Criteria andCheckStartDateNotEqualTo(Date value) {
            addCriterion("check_start_date <>", value, "checkStartDate");
            return (Criteria) this;
        }

        public Criteria andCheckStartDateGreaterThan(Date value) {
            addCriterion("check_start_date >", value, "checkStartDate");
            return (Criteria) this;
        }

        public Criteria andCheckStartDateGreaterThanOrEqualTo(Date value) {
            addCriterion("check_start_date >=", value, "checkStartDate");
            return (Criteria) this;
        }

        public Criteria andCheckStartDateLessThan(Date value) {
            addCriterion("check_start_date <", value, "checkStartDate");
            return (Criteria) this;
        }

        public Criteria andCheckStartDateLessThanOrEqualTo(Date value) {
            addCriterion("check_start_date <=", value, "checkStartDate");
            return (Criteria) this;
        }

        public Criteria andCheckStartDateIn(List<Date> values) {
            addCriterion("check_start_date in", values, "checkStartDate");
            return (Criteria) this;
        }

        public Criteria andCheckStartDateNotIn(List<Date> values) {
            addCriterion("check_start_date not in", values, "checkStartDate");
            return (Criteria) this;
        }

        public Criteria andCheckStartDateBetween(Date value1, Date value2) {
            addCriterion("check_start_date between", value1, value2, "checkStartDate");
            return (Criteria) this;
        }

        public Criteria andCheckStartDateNotBetween(Date value1, Date value2) {
            addCriterion("check_start_date not between", value1, value2, "checkStartDate");
            return (Criteria) this;
        }

        public Criteria andCheckEndDateIsNull() {
            addCriterion("check_end_date is null");
            return (Criteria) this;
        }

        public Criteria andCheckEndDateIsNotNull() {
            addCriterion("check_end_date is not null");
            return (Criteria) this;
        }

        public Criteria andCheckEndDateEqualTo(Date value) {
            addCriterion("check_end_date =", value, "checkEndDate");
            return (Criteria) this;
        }

        public Criteria andCheckEndDateNotEqualTo(Date value) {
            addCriterion("check_end_date <>", value, "checkEndDate");
            return (Criteria) this;
        }

        public Criteria andCheckEndDateGreaterThan(Date value) {
            addCriterion("check_end_date >", value, "checkEndDate");
            return (Criteria) this;
        }

        public Criteria andCheckEndDateGreaterThanOrEqualTo(Date value) {
            addCriterion("check_end_date >=", value, "checkEndDate");
            return (Criteria) this;
        }

        public Criteria andCheckEndDateLessThan(Date value) {
            addCriterion("check_end_date <", value, "checkEndDate");
            return (Criteria) this;
        }

        public Criteria andCheckEndDateLessThanOrEqualTo(Date value) {
            addCriterion("check_end_date <=", value, "checkEndDate");
            return (Criteria) this;
        }

        public Criteria andCheckEndDateIn(List<Date> values) {
            addCriterion("check_end_date in", values, "checkEndDate");
            return (Criteria) this;
        }

        public Criteria andCheckEndDateNotIn(List<Date> values) {
            addCriterion("check_end_date not in", values, "checkEndDate");
            return (Criteria) this;
        }

        public Criteria andCheckEndDateBetween(Date value1, Date value2) {
            addCriterion("check_end_date between", value1, value2, "checkEndDate");
            return (Criteria) this;
        }

        public Criteria andCheckEndDateNotBetween(Date value1, Date value2) {
            addCriterion("check_end_date not between", value1, value2, "checkEndDate");
            return (Criteria) this;
        }

        public Criteria andCheckStatusIsNull() {
            addCriterion("check_status is null");
            return (Criteria) this;
        }

        public Criteria andCheckStatusIsNotNull() {
            addCriterion("check_status is not null");
            return (Criteria) this;
        }

        public Criteria andCheckStatusEqualTo(Integer value) {
            addCriterion("check_status =", value, "checkStatus");
            return (Criteria) this;
        }

        public Criteria andCheckStatusNotEqualTo(Integer value) {
            addCriterion("check_status <>", value, "checkStatus");
            return (Criteria) this;
        }

        public Criteria andCheckStatusGreaterThan(Integer value) {
            addCriterion("check_status >", value, "checkStatus");
            return (Criteria) this;
        }

        public Criteria andCheckStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("check_status >=", value, "checkStatus");
            return (Criteria) this;
        }

        public Criteria andCheckStatusLessThan(Integer value) {
            addCriterion("check_status <", value, "checkStatus");
            return (Criteria) this;
        }

        public Criteria andCheckStatusLessThanOrEqualTo(Integer value) {
            addCriterion("check_status <=", value, "checkStatus");
            return (Criteria) this;
        }

        public Criteria andCheckStatusIn(List<Integer> values) {
            addCriterion("check_status in", values, "checkStatus");
            return (Criteria) this;
        }

        public Criteria andCheckStatusNotIn(List<Integer> values) {
            addCriterion("check_status not in", values, "checkStatus");
            return (Criteria) this;
        }

        public Criteria andCheckStatusBetween(Integer value1, Integer value2) {
            addCriterion("check_status between", value1, value2, "checkStatus");
            return (Criteria) this;
        }

        public Criteria andCheckStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("check_status not between", value1, value2, "checkStatus");
            return (Criteria) this;
        }

        public Criteria andCheckLastTimeIsNull() {
            addCriterion("check_last_time is null");
            return (Criteria) this;
        }

        public Criteria andCheckLastTimeIsNotNull() {
            addCriterion("check_last_time is not null");
            return (Criteria) this;
        }

        public Criteria andCheckLastTimeEqualTo(Date value) {
            addCriterion("check_last_time =", value, "checkLastTime");
            return (Criteria) this;
        }

        public Criteria andCheckLastTimeNotEqualTo(Date value) {
            addCriterion("check_last_time <>", value, "checkLastTime");
            return (Criteria) this;
        }

        public Criteria andCheckLastTimeGreaterThan(Date value) {
            addCriterion("check_last_time >", value, "checkLastTime");
            return (Criteria) this;
        }

        public Criteria andCheckLastTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("check_last_time >=", value, "checkLastTime");
            return (Criteria) this;
        }

        public Criteria andCheckLastTimeLessThan(Date value) {
            addCriterion("check_last_time <", value, "checkLastTime");
            return (Criteria) this;
        }

        public Criteria andCheckLastTimeLessThanOrEqualTo(Date value) {
            addCriterion("check_last_time <=", value, "checkLastTime");
            return (Criteria) this;
        }

        public Criteria andCheckLastTimeIn(List<Date> values) {
            addCriterion("check_last_time in", values, "checkLastTime");
            return (Criteria) this;
        }

        public Criteria andCheckLastTimeNotIn(List<Date> values) {
            addCriterion("check_last_time not in", values, "checkLastTime");
            return (Criteria) this;
        }

        public Criteria andCheckLastTimeBetween(Date value1, Date value2) {
            addCriterion("check_last_time between", value1, value2, "checkLastTime");
            return (Criteria) this;
        }

        public Criteria andCheckLastTimeNotBetween(Date value1, Date value2) {
            addCriterion("check_last_time not between", value1, value2, "checkLastTime");
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

        public Criteria andChannelCodeIsNull() {
            addCriterion("channel_code is null");
            return (Criteria) this;
        }

        public Criteria andChannelCodeIsNotNull() {
            addCriterion("channel_code is not null");
            return (Criteria) this;
        }

        public Criteria andChannelCodeEqualTo(String value) {
            addCriterion("channel_code =", value, "channelCode");
            return (Criteria) this;
        }

        public Criteria andChannelCodeNotEqualTo(String value) {
            addCriterion("channel_code <>", value, "channelCode");
            return (Criteria) this;
        }

        public Criteria andChannelCodeGreaterThan(String value) {
            addCriterion("channel_code >", value, "channelCode");
            return (Criteria) this;
        }

        public Criteria andChannelCodeGreaterThanOrEqualTo(String value) {
            addCriterion("channel_code >=", value, "channelCode");
            return (Criteria) this;
        }

        public Criteria andChannelCodeLessThan(String value) {
            addCriterion("channel_code <", value, "channelCode");
            return (Criteria) this;
        }

        public Criteria andChannelCodeLessThanOrEqualTo(String value) {
            addCriterion("channel_code <=", value, "channelCode");
            return (Criteria) this;
        }

        public Criteria andChannelCodeLike(String value) {
            addCriterion("channel_code like", value, "channelCode");
            return (Criteria) this;
        }

        public Criteria andChannelCodeNotLike(String value) {
            addCriterion("channel_code not like", value, "channelCode");
            return (Criteria) this;
        }

        public Criteria andChannelCodeIn(List<String> values) {
            addCriterion("channel_code in", values, "channelCode");
            return (Criteria) this;
        }

        public Criteria andChannelCodeNotIn(List<String> values) {
            addCriterion("channel_code not in", values, "channelCode");
            return (Criteria) this;
        }

        public Criteria andChannelCodeBetween(String value1, String value2) {
            addCriterion("channel_code between", value1, value2, "channelCode");
            return (Criteria) this;
        }

        public Criteria andChannelCodeNotBetween(String value1, String value2) {
            addCriterion("channel_code not between", value1, value2, "channelCode");
            return (Criteria) this;
        }

        public Criteria andChannelNameIsNull() {
            addCriterion("channel_name is null");
            return (Criteria) this;
        }

        public Criteria andChannelNameIsNotNull() {
            addCriterion("channel_name is not null");
            return (Criteria) this;
        }

        public Criteria andChannelNameEqualTo(String value) {
            addCriterion("channel_name =", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameNotEqualTo(String value) {
            addCriterion("channel_name <>", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameGreaterThan(String value) {
            addCriterion("channel_name >", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameGreaterThanOrEqualTo(String value) {
            addCriterion("channel_name >=", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameLessThan(String value) {
            addCriterion("channel_name <", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameLessThanOrEqualTo(String value) {
            addCriterion("channel_name <=", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameLike(String value) {
            addCriterion("channel_name like", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameNotLike(String value) {
            addCriterion("channel_name not like", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameIn(List<String> values) {
            addCriterion("channel_name in", values, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameNotIn(List<String> values) {
            addCriterion("channel_name not in", values, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameBetween(String value1, String value2) {
            addCriterion("channel_name between", value1, value2, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameNotBetween(String value1, String value2) {
            addCriterion("channel_name not between", value1, value2, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelTypeIsNull() {
            addCriterion("channel_type is null");
            return (Criteria) this;
        }

        public Criteria andChannelTypeIsNotNull() {
            addCriterion("channel_type is not null");
            return (Criteria) this;
        }

        public Criteria andChannelTypeEqualTo(Integer value) {
            addCriterion("channel_type =", value, "channelType");
            return (Criteria) this;
        }

        public Criteria andChannelTypeNotEqualTo(Integer value) {
            addCriterion("channel_type <>", value, "channelType");
            return (Criteria) this;
        }

        public Criteria andChannelTypeGreaterThan(Integer value) {
            addCriterion("channel_type >", value, "channelType");
            return (Criteria) this;
        }

        public Criteria andChannelTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("channel_type >=", value, "channelType");
            return (Criteria) this;
        }

        public Criteria andChannelTypeLessThan(Integer value) {
            addCriterion("channel_type <", value, "channelType");
            return (Criteria) this;
        }

        public Criteria andChannelTypeLessThanOrEqualTo(Integer value) {
            addCriterion("channel_type <=", value, "channelType");
            return (Criteria) this;
        }

        public Criteria andChannelTypeIn(List<Integer> values) {
            addCriterion("channel_type in", values, "channelType");
            return (Criteria) this;
        }

        public Criteria andChannelTypeNotIn(List<Integer> values) {
            addCriterion("channel_type not in", values, "channelType");
            return (Criteria) this;
        }

        public Criteria andChannelTypeBetween(Integer value1, Integer value2) {
            addCriterion("channel_type between", value1, value2, "channelType");
            return (Criteria) this;
        }

        public Criteria andChannelTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("channel_type not between", value1, value2, "channelType");
            return (Criteria) this;
        }

        public Criteria andPlanCodeIsNull() {
            addCriterion("plan_code is null");
            return (Criteria) this;
        }

        public Criteria andPlanCodeIsNotNull() {
            addCriterion("plan_code is not null");
            return (Criteria) this;
        }

        public Criteria andPlanCodeEqualTo(String value) {
            addCriterion("plan_code =", value, "planCode");
            return (Criteria) this;
        }

        public Criteria andPlanCodeNotEqualTo(String value) {
            addCriterion("plan_code <>", value, "planCode");
            return (Criteria) this;
        }

        public Criteria andPlanCodeGreaterThan(String value) {
            addCriterion("plan_code >", value, "planCode");
            return (Criteria) this;
        }

        public Criteria andPlanCodeGreaterThanOrEqualTo(String value) {
            addCriterion("plan_code >=", value, "planCode");
            return (Criteria) this;
        }

        public Criteria andPlanCodeLessThan(String value) {
            addCriterion("plan_code <", value, "planCode");
            return (Criteria) this;
        }

        public Criteria andPlanCodeLessThanOrEqualTo(String value) {
            addCriterion("plan_code <=", value, "planCode");
            return (Criteria) this;
        }

        public Criteria andPlanCodeLike(String value) {
            addCriterion("plan_code like", value, "planCode");
            return (Criteria) this;
        }

        public Criteria andPlanCodeNotLike(String value) {
            addCriterion("plan_code not like", value, "planCode");
            return (Criteria) this;
        }

        public Criteria andPlanCodeIn(List<String> values) {
            addCriterion("plan_code in", values, "planCode");
            return (Criteria) this;
        }

        public Criteria andPlanCodeNotIn(List<String> values) {
            addCriterion("plan_code not in", values, "planCode");
            return (Criteria) this;
        }

        public Criteria andPlanCodeBetween(String value1, String value2) {
            addCriterion("plan_code between", value1, value2, "planCode");
            return (Criteria) this;
        }

        public Criteria andPlanCodeNotBetween(String value1, String value2) {
            addCriterion("plan_code not between", value1, value2, "planCode");
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