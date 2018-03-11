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

        public Criteria andProvinceCodeIsNull() {
            addCriterion("province_code is null");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeIsNotNull() {
            addCriterion("province_code is not null");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeEqualTo(String value) {
            addCriterion("province_code =", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeNotEqualTo(String value) {
            addCriterion("province_code <>", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeGreaterThan(String value) {
            addCriterion("province_code >", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeGreaterThanOrEqualTo(String value) {
            addCriterion("province_code >=", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeLessThan(String value) {
            addCriterion("province_code <", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeLessThanOrEqualTo(String value) {
            addCriterion("province_code <=", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeLike(String value) {
            addCriterion("province_code like", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeNotLike(String value) {
            addCriterion("province_code not like", value, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeIn(List<String> values) {
            addCriterion("province_code in", values, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeNotIn(List<String> values) {
            addCriterion("province_code not in", values, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeBetween(String value1, String value2) {
            addCriterion("province_code between", value1, value2, "provinceCode");
            return (Criteria) this;
        }

        public Criteria andProvinceCodeNotBetween(String value1, String value2) {
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

        public Criteria andCityCodeEqualTo(String value) {
            addCriterion("city_code =", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeNotEqualTo(String value) {
            addCriterion("city_code <>", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeGreaterThan(String value) {
            addCriterion("city_code >", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeGreaterThanOrEqualTo(String value) {
            addCriterion("city_code >=", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeLessThan(String value) {
            addCriterion("city_code <", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeLessThanOrEqualTo(String value) {
            addCriterion("city_code <=", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeLike(String value) {
            addCriterion("city_code like", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeNotLike(String value) {
            addCriterion("city_code not like", value, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeIn(List<String> values) {
            addCriterion("city_code in", values, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeNotIn(List<String> values) {
            addCriterion("city_code not in", values, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeBetween(String value1, String value2) {
            addCriterion("city_code between", value1, value2, "cityCode");
            return (Criteria) this;
        }

        public Criteria andCityCodeNotBetween(String value1, String value2) {
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

        public Criteria andStoreTypeNameIsNull() {
            addCriterion("store_type_name is null");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameIsNotNull() {
            addCriterion("store_type_name is not null");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameEqualTo(String value) {
            addCriterion("store_type_name =", value, "storeTypeName");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameNotEqualTo(String value) {
            addCriterion("store_type_name <>", value, "storeTypeName");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameGreaterThan(String value) {
            addCriterion("store_type_name >", value, "storeTypeName");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameGreaterThanOrEqualTo(String value) {
            addCriterion("store_type_name >=", value, "storeTypeName");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameLessThan(String value) {
            addCriterion("store_type_name <", value, "storeTypeName");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameLessThanOrEqualTo(String value) {
            addCriterion("store_type_name <=", value, "storeTypeName");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameLike(String value) {
            addCriterion("store_type_name like", value, "storeTypeName");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameNotLike(String value) {
            addCriterion("store_type_name not like", value, "storeTypeName");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameIn(List<String> values) {
            addCriterion("store_type_name in", values, "storeTypeName");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameNotIn(List<String> values) {
            addCriterion("store_type_name not in", values, "storeTypeName");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameBetween(String value1, String value2) {
            addCriterion("store_type_name between", value1, value2, "storeTypeName");
            return (Criteria) this;
        }

        public Criteria andStoreTypeNameNotBetween(String value1, String value2) {
            addCriterion("store_type_name not between", value1, value2, "storeTypeName");
            return (Criteria) this;
        }

        public Criteria andRemkarkIsNull() {
            addCriterion("remkark is null");
            return (Criteria) this;
        }

        public Criteria andRemkarkIsNotNull() {
            addCriterion("remkark is not null");
            return (Criteria) this;
        }

        public Criteria andRemkarkEqualTo(String value) {
            addCriterion("remkark =", value, "remkark");
            return (Criteria) this;
        }

        public Criteria andRemkarkNotEqualTo(String value) {
            addCriterion("remkark <>", value, "remkark");
            return (Criteria) this;
        }

        public Criteria andRemkarkGreaterThan(String value) {
            addCriterion("remkark >", value, "remkark");
            return (Criteria) this;
        }

        public Criteria andRemkarkGreaterThanOrEqualTo(String value) {
            addCriterion("remkark >=", value, "remkark");
            return (Criteria) this;
        }

        public Criteria andRemkarkLessThan(String value) {
            addCriterion("remkark <", value, "remkark");
            return (Criteria) this;
        }

        public Criteria andRemkarkLessThanOrEqualTo(String value) {
            addCriterion("remkark <=", value, "remkark");
            return (Criteria) this;
        }

        public Criteria andRemkarkLike(String value) {
            addCriterion("remkark like", value, "remkark");
            return (Criteria) this;
        }

        public Criteria andRemkarkNotLike(String value) {
            addCriterion("remkark not like", value, "remkark");
            return (Criteria) this;
        }

        public Criteria andRemkarkIn(List<String> values) {
            addCriterion("remkark in", values, "remkark");
            return (Criteria) this;
        }

        public Criteria andRemkarkNotIn(List<String> values) {
            addCriterion("remkark not in", values, "remkark");
            return (Criteria) this;
        }

        public Criteria andRemkarkBetween(String value1, String value2) {
            addCriterion("remkark between", value1, value2, "remkark");
            return (Criteria) this;
        }

        public Criteria andRemkarkNotBetween(String value1, String value2) {
            addCriterion("remkark not between", value1, value2, "remkark");
            return (Criteria) this;
        }

        public Criteria andBlz1IsNull() {
            addCriterion("blz1 is null");
            return (Criteria) this;
        }

        public Criteria andBlz1IsNotNull() {
            addCriterion("blz1 is not null");
            return (Criteria) this;
        }

        public Criteria andBlz1EqualTo(String value) {
            addCriterion("blz1 =", value, "blz1");
            return (Criteria) this;
        }

        public Criteria andBlz1NotEqualTo(String value) {
            addCriterion("blz1 <>", value, "blz1");
            return (Criteria) this;
        }

        public Criteria andBlz1GreaterThan(String value) {
            addCriterion("blz1 >", value, "blz1");
            return (Criteria) this;
        }

        public Criteria andBlz1GreaterThanOrEqualTo(String value) {
            addCriterion("blz1 >=", value, "blz1");
            return (Criteria) this;
        }

        public Criteria andBlz1LessThan(String value) {
            addCriterion("blz1 <", value, "blz1");
            return (Criteria) this;
        }

        public Criteria andBlz1LessThanOrEqualTo(String value) {
            addCriterion("blz1 <=", value, "blz1");
            return (Criteria) this;
        }

        public Criteria andBlz1Like(String value) {
            addCriterion("blz1 like", value, "blz1");
            return (Criteria) this;
        }

        public Criteria andBlz1NotLike(String value) {
            addCriterion("blz1 not like", value, "blz1");
            return (Criteria) this;
        }

        public Criteria andBlz1In(List<String> values) {
            addCriterion("blz1 in", values, "blz1");
            return (Criteria) this;
        }

        public Criteria andBlz1NotIn(List<String> values) {
            addCriterion("blz1 not in", values, "blz1");
            return (Criteria) this;
        }

        public Criteria andBlz1Between(String value1, String value2) {
            addCriterion("blz1 between", value1, value2, "blz1");
            return (Criteria) this;
        }

        public Criteria andBlz1NotBetween(String value1, String value2) {
            addCriterion("blz1 not between", value1, value2, "blz1");
            return (Criteria) this;
        }

        public Criteria andBlz2IsNull() {
            addCriterion("blz2 is null");
            return (Criteria) this;
        }

        public Criteria andBlz2IsNotNull() {
            addCriterion("blz2 is not null");
            return (Criteria) this;
        }

        public Criteria andBlz2EqualTo(String value) {
            addCriterion("blz2 =", value, "blz2");
            return (Criteria) this;
        }

        public Criteria andBlz2NotEqualTo(String value) {
            addCriterion("blz2 <>", value, "blz2");
            return (Criteria) this;
        }

        public Criteria andBlz2GreaterThan(String value) {
            addCriterion("blz2 >", value, "blz2");
            return (Criteria) this;
        }

        public Criteria andBlz2GreaterThanOrEqualTo(String value) {
            addCriterion("blz2 >=", value, "blz2");
            return (Criteria) this;
        }

        public Criteria andBlz2LessThan(String value) {
            addCriterion("blz2 <", value, "blz2");
            return (Criteria) this;
        }

        public Criteria andBlz2LessThanOrEqualTo(String value) {
            addCriterion("blz2 <=", value, "blz2");
            return (Criteria) this;
        }

        public Criteria andBlz2Like(String value) {
            addCriterion("blz2 like", value, "blz2");
            return (Criteria) this;
        }

        public Criteria andBlz2NotLike(String value) {
            addCriterion("blz2 not like", value, "blz2");
            return (Criteria) this;
        }

        public Criteria andBlz2In(List<String> values) {
            addCriterion("blz2 in", values, "blz2");
            return (Criteria) this;
        }

        public Criteria andBlz2NotIn(List<String> values) {
            addCriterion("blz2 not in", values, "blz2");
            return (Criteria) this;
        }

        public Criteria andBlz2Between(String value1, String value2) {
            addCriterion("blz2 between", value1, value2, "blz2");
            return (Criteria) this;
        }

        public Criteria andBlz2NotBetween(String value1, String value2) {
            addCriterion("blz2 not between", value1, value2, "blz2");
            return (Criteria) this;
        }

        public Criteria andBlz3IsNull() {
            addCriterion("blz3 is null");
            return (Criteria) this;
        }

        public Criteria andBlz3IsNotNull() {
            addCriterion("blz3 is not null");
            return (Criteria) this;
        }

        public Criteria andBlz3EqualTo(String value) {
            addCriterion("blz3 =", value, "blz3");
            return (Criteria) this;
        }

        public Criteria andBlz3NotEqualTo(String value) {
            addCriterion("blz3 <>", value, "blz3");
            return (Criteria) this;
        }

        public Criteria andBlz3GreaterThan(String value) {
            addCriterion("blz3 >", value, "blz3");
            return (Criteria) this;
        }

        public Criteria andBlz3GreaterThanOrEqualTo(String value) {
            addCriterion("blz3 >=", value, "blz3");
            return (Criteria) this;
        }

        public Criteria andBlz3LessThan(String value) {
            addCriterion("blz3 <", value, "blz3");
            return (Criteria) this;
        }

        public Criteria andBlz3LessThanOrEqualTo(String value) {
            addCriterion("blz3 <=", value, "blz3");
            return (Criteria) this;
        }

        public Criteria andBlz3Like(String value) {
            addCriterion("blz3 like", value, "blz3");
            return (Criteria) this;
        }

        public Criteria andBlz3NotLike(String value) {
            addCriterion("blz3 not like", value, "blz3");
            return (Criteria) this;
        }

        public Criteria andBlz3In(List<String> values) {
            addCriterion("blz3 in", values, "blz3");
            return (Criteria) this;
        }

        public Criteria andBlz3NotIn(List<String> values) {
            addCriterion("blz3 not in", values, "blz3");
            return (Criteria) this;
        }

        public Criteria andBlz3Between(String value1, String value2) {
            addCriterion("blz3 between", value1, value2, "blz3");
            return (Criteria) this;
        }

        public Criteria andBlz3NotBetween(String value1, String value2) {
            addCriterion("blz3 not between", value1, value2, "blz3");
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