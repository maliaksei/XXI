using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using Repository.Pattern.Ef6;
using Repository.Pattern.Infrastructure;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Models.Entities;
using XXI.Centuty.DataBusiness.Models.Enums;

namespace XXI.Centuty.DataBusiness.Services
{
    public class OrderService
    {
        public IRepository<OrderEntity> _orderRepository;
        public IRepository<OrderCommodityEntity> _orderCommodityRepository;
        public IUnitOfWorkAsync _unitOfWork;
        public XXIDataContext _dataContext;

        public OrderService()
        {
            _dataContext = new XXIDataContext();
            _unitOfWork = new UnitOfWork(_dataContext);
            _orderRepository = new Repository<OrderEntity>(_dataContext, _unitOfWork);
            _orderCommodityRepository = new Repository<OrderCommodityEntity>(_dataContext, _unitOfWork);
        }

        public IQueryable<OrderEntity> GetAllOrders()
        {
            return _orderRepository.Queryable().Include(x => x.Address);
        }

        public IQueryable<OrderEntity> GetOrdersByStatus(OrderStatus? orderStatus)
        {
            return _orderRepository.Queryable().Where(x => x.Status == orderStatus);
        }

        public OrderEntity GetOrderByInCartStatusAndUserIdIncludeProduct(long userId)
        {
            return _orderRepository.Queryable().Include("OrderCommodities.Product").FirstOrDefault(x => x.UserId == userId && x.Status == OrderStatus.InCart);
        }

        public OrderEntity GetOrderByIdAndUserIdIncludeAddress(long orderId, long userId)
        {
            return _orderRepository.Queryable().Include("Address").SingleOrDefault(x => x.Id == orderId && x.UserId == userId);
        }

        public OrderEntity GetOrderByIdIncludeAddress(long orderId)
        {
            return _orderRepository.Queryable().Include("Address").SingleOrDefault(x => x.Id == orderId);
        }

        public IEnumerable<OrderEntity> GetOrdersByUserId(long userId)
        {
            return _orderRepository.Queryable().Include("Address").Where(x => x.UserId == userId);
        }

        public IQueryable<OrderCommodityEntity> GetInCardOrderCommodity(long userId)
        {
            var inCartOrder = GetInCartOrder(userId);
            return
                _orderCommodityRepository.Queryable().Include("Product")
                    .Where(x => x.OrderId == inCartOrder.Id);
        }

        public IQueryable<OrderCommodityEntity> GetOrderCommodityByUserIdAndOrderId(long userId, long orderId)
        {
            var order = _orderRepository.Queryable().SingleOrDefault(x => x.Id == orderId && x.UserId == userId);
            if (order != null)
            {
                return
                _orderCommodityRepository.Queryable().Include("Product")
                    .Where(x => x.OrderId == order.Id);
            }
            return null;
        }

        public IQueryable<OrderCommodityEntity> GetOrderCommodityByOrderId(long orderId)
        {
            return
                  _orderCommodityRepository.Queryable().Include("Product")
                      .Where(x => x.OrderId == orderId);
        }

        public void DeleteOrderCommodityByCommodityId(long orderCommodityId)
        {
            var orderCommodity = _orderCommodityRepository.Queryable().SingleOrDefault(x => x.Id == orderCommodityId);
            _orderCommodityRepository.Delete(orderCommodity);
            _dataContext.SaveChanges();
        }

        public void AddProductToCart(long productId, long userId, int count = 1)
        {
            var curentOrderCommodity = GetInCardOrderCommodity(userId).ToList();
            var curentOrder = GetInCartOrder(userId);
            var orderCommodity = new OrderCommodityEntity
            {
                OrderId = curentOrder.Id,
                ProductId = productId,
                Count = count,
                ObjectState = ObjectState.Added
            };
            if (curentOrderCommodity.All(x => x.ProductId != productId))
            {
                _orderCommodityRepository.Insert(orderCommodity);
                _unitOfWork.SaveChanges();
            }
        }

        public void QuantityDown(long orderCommodityId)
        {
            var orderCommodity = _orderCommodityRepository.Queryable().SingleOrDefault(x => x.Id == orderCommodityId);
            orderCommodity.Count -= 1;
            _orderCommodityRepository.Update(orderCommodity);
            _unitOfWork.SaveChanges();
        }

        public void QuantityUp(long orderCommodityId)
        {
            var orderCommodity = _orderCommodityRepository.Queryable().SingleOrDefault(x => x.Id == orderCommodityId);
            orderCommodity.Count += 1;
            _orderCommodityRepository.Update(orderCommodity);
            _unitOfWork.SaveChanges();
        }

        public void CompleteOrder(ShoppingCartDataModel shoppingCartData)
        {
            var order = GetOrderByInCartStatusAndUserIdIncludeProduct(shoppingCartData.UserId);
            if (order != null)
            {
                order.Status = OrderStatus.Issued;
                order.DeliveryAddresId = shoppingCartData.AddresId;
                order.ShippingMethod = shoppingCartData.ShipingMethod;
                order.PaymentMethod = shoppingCartData.PaymentMethod;
                order.PhoneNumber = shoppingCartData.PhoneNumber;
                _orderRepository.Update(order);
                _dataContext.SaveChanges();
            }
        }

        public void ChangeOrderStatus(long orderId, OrderStatus orderStatus)
        {
            var order = _orderRepository.Queryable().SingleOrDefault(x => x.Id == orderId);
            if (order != null)
            {
                order.Status = orderStatus;
                order.ObjectState = ObjectState.Modified;
                _orderRepository.Update(order);
                _dataContext.SaveChanges();
            }
        }

        private OrderEntity GetInCartOrder(long userId)
        {
            var order =
               _orderRepository.Queryable().SingleOrDefault(x => x.UserId == userId && x.Status == OrderStatus.InCart);
            if (order != null) return order;
            order = new OrderEntity
            {
                UserId = userId,
                Status = OrderStatus.InCart,
            };
            _orderRepository.Insert(order);
            _dataContext.SaveChanges();
            return order;
        }
    }
}