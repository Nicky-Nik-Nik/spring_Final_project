package by.bntu.fitr.springtry.service;


import by.bntu.fitr.springtry.entity.Lot;
import by.bntu.fitr.springtry.entity.User;
import org.springframework.data.domain.Page;

import java.sql.Timestamp;
import java.util.List;

/**
 * The interface provides action for lot
 */
public interface LotService {
    /**
     * Service to create a new lot
     *
     * @param name
     * @param description
     * @param startBid
     * @param startTime
     * @param finishTime
     * @param sellerId
     * @param images
     * @return a new Lot
     * @throws ServiceException
     */
    Lot createNewLot(String name, String description, String startBid, Timestamp startTime, Timestamp finishTime,
                     User sellerId, List<String> images);

    /**
     * Service to find lot by id
     *
     * @param id
     * @return found Lot
     * @throws ServiceException
     */
    Lot findLotById(long id);

    /**
     * Service to find list of lots that has exact string in their name
     *
     * @param name
     * @param pageNumber number of page for paging
     * @param amountPerPage amount of lots per one page
     * @return list of lots or empty list if no lots found
     * @throws ServiceException
     */
    Page<Lot> findLotByName(String name, int pageNumber, int amountPerPage);

    /**
     * Service to find list of lots that were bid by exact buyer
     *
     * @param buyer
     * @param pageNumber number of page for paging
     * @param amountPerPage amount of lots per page
     * @return list of lots or empty list if no lots found
     * @throws ServiceException
     */
    Page<Lot> findLotByBuyerId(User buyer, int pageNumber, int amountPerPage);

    /**
     * Service to find list of lots that are selling by exact seller
     *
     * @param seller
     * @param pageNumber number of page for paging
     * @param amountPerPage amount of lots per page
     * @return list of lots or empty list if no lots found
     * @throws ServiceException
     */
    Page<Lot> findLotBySellerId(User seller, int pageNumber, int amountPerPage);

    /**
     * Service to find list of lots that are active now
     *
     * @param pageNumber number of page for paging
     * @param amountPerPage amount of lots per page
     * @return list of lots or empty list if no lots found
     * @throws ServiceException
     */
    Page<Lot> findActive(int pageNumber, int amountPerPage);

    /**
     * Service to find list of all lots
     *
     * @param pageNumber number of page for paging
     * @param amountPerPage amount of lots per page
     * @return list of lots or empty list if no lots found
     * @throws ServiceException
     */
    Page<Lot> findAll(int pageNumber, int amountPerPage);

    /**
     * Service to find out if lot has been submitted by admin
     *
     * @param lotId
     * @return true if lot is submitted or else false
     * @throws ServiceException
     */
    boolean isLotSubmitted(long lotId);
}
